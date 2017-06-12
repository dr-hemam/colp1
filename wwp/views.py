from colp import app, db
from project.models import Project
from flask import render_template, redirect, url_for, request, session, flash
from users.models import User
from users.decorators import *
from wwp.models import WWP, WWPDetail
from wwp.form import WWPForm, WWPDetailForm
from calendars.models import ReportingDate
from constraints.models import Constraint
from sections.models import Section
from lookaheads.models import LookAheadDetail, LookAhead
from constraintsanalysis.models import ConstraintAnalysis, ConstraintAnalysisDetail
from sqlalchemy import exc, desc
from calendars.models import ReportingDate

def getCheckbox(cn):
    ccd=[]
    x=0
    while(x <len(cn)):
        if cn[x]=='No':
            ccd.append(False)
            x= x+1
        else:
            ccd.append(True)
            x=x+2
    return ccd


@app.route('/newwwp', methods=['POST', 'GET'])
@login_required
@project_required
def new_wwp():
    form =WWPForm()
    form.reportingdate.query = ReportingDate.query.filter_by(project_id= session.get('project_id'))
    form.section.query = Section.query.filter_by(project_id= session.get('project_id'))
    if request.method == "POST" and form.validate() and session.get('project_id'):
        project = Project.query.filter_by(id=session.get('project_id')).first()
        try:
            wwp = WWP (project= project,
                    reportingdate= form.reportingdate.data,
                    section= form.section.data,
                    is_active = form.is_active.data)
            db.session.add(wwp)
            db.session.flush()
            db.session.commit()
            flash ("Added Sussefully! please create details of your weekly work plan", 'alert-success')
            return redirect(url_for('new_wwp_details', id= wwp.id))
        except exc.IntegrityError as e:
            db.session.rollback()
            flash('Error: Duplicate Entry. you can edit or delete existing.', 'alert-danger')
            return redirect(url_for('new_wwp_details', id= wwp.id))
    return render_template('wwp/wwpform.html', form=form, action='new')
    

@app.route('/newwwpdetails/<id>', methods=['POST', 'GET'])
def new_wwp_details(id):

    form = WWPDetailForm()
    wwp = WWP.query.filter_by(id= id).first()
    ca = ConstraintAnalysis.query.filter_by(project_id=wwp.project_id, section_id=wwp.section_id, reportingdate_id=wwp.reportingdate_id).first()
    lookahead = LookAhead.query.filter_by(reportingdate_id = wwp.reportingdate_id, section_id= wwp.section_id).first()
    if lookahead:
        form.task.query = LookAheadDetail.query.join(ConstraintAnalysisDetail).join(LookAhead, aliased=True).filter(LookAheadDetail.lookahead_id==lookahead.id, ConstraintAnalysisDetail.constraintanalysis_id==ca.id, ConstraintAnalysisDetail.can_do== True )
    else:
        flash('No lookahead tasks found. Please prepare the lookahead first!', 'alert-danger')
        return redirect(url_for('view_wwps'))
    #= LookAheadDetail.query.join(ConstraintAnalysisDetail).join(LookAhead, aliased=True).filter_by(section_id==wwp.section_id, constraintanalysis_id==ca.id, ConstraintAnalysisDetail.can_do== True )

    if request.method == "POST" and form.validate():
        constraints = Constraint.query.filter_by(project_id = session.get('project_id'), is_active=True).all()
        constraintanalysis = ConstraintAnalysis.query.filter_by(id= id).first()
        
        activities = request.form.getlist('task')
        users = request.form.getlist('user')
        is_actives = request.form.getlist('is_active')
        mon = getCheckbox(request.form.getlist('mon'))
        tue = getCheckbox(request.form.getlist('tue'))
        wed = getCheckbox(request.form.getlist('wed'))
        thu = getCheckbox(request.form.getlist('thu'))
        fri = getCheckbox(request.form.getlist('fri'))
        sat = getCheckbox(request.form.getlist('sat'))
        sun = getCheckbox(request.form.getlist('sun'))
        print(mon, tue, wed,thu, fri, sat, sun)
        #statuses = request.form.getlist('status')
        #can_dos = request.form.getlist('can_do')
        for i in range(len(activities)):
            task = LookAheadDetail.query.filter_by(id=activities[i]).first()
            user = User.query.filter_by(id= users[i]).first()
            wwpdetail= WWPDetail (wwp= wwp,
                                    task= task,
                                    user = user,
                                    mon= mon[i],
                                    tue= tue[i],
                                    wed=wed[i],
                                    thu= thu[i],
                                    fri= fri[i],
                                    sat= sat[i],
                                    sun= sun[i]
                                    )
            db.session.add(wwpdetail)
        db.session.commit()
        flash("Weekly Work Plan saved successfully!",'alert-success')
        return redirect(url_for('view_wwp_detail', id=id))
# except:
#     flash('An error has occurred while creating the Weekly Work Plan')
#     return redirect(url_for('view_wwps'))
    return render_template('wwp/wwpdetails.html', form=form, action='new', wwp = wwp)
   
@app.route('/viewwwp')
@login_required
@project_required
def view_wwps():
    #wwp= WWP.query.filter_by(project_id=session.get('project_id'), is_active=True)
    wwp= WWP.query.join(ReportingDate).filter(WWP.project_id==session['project_id'], WWP.is_active==True)
    wwp = wwp.order_by(desc('rdate')).all()
    
    return render_template('wwp/view_wwps.html', wwp=wwp)
    
@app.route('/viewwwpdetail/<id>')
@login_required
@project_required
def view_wwp_detail(id):
    wwp= WWP.query.filter_by(id=id).first()
    wwpdetails = WWPDetail.query.filter_by(wwp_id=wwp.id,is_active=True).all()
    return render_template('wwp/viewwwpdetails.html', wwp=wwp, wwpdetails= wwpdetails)

    
    #return render_template('wwp/view_wwps.html', wwp=wwp)
    
@app.route('/deletewwpdetail', methods=['GET'])
@login_required
@project_required
def delete_wwp_detail():
    try:
        wwp_id = request.args.get('w_id')
        task_id = request.args.get('t_id')
        wwpdetail = WWPDetail.query.filter_by(wwp_id=wwp_id, task_id=task_id).first()
        wwpdetail.is_active= False
        db.session.add(wwpdetail)
        db.session.commit()
        flash('The selected activities has been deleted successfully','alert-success')
        return redirect(url_for('view_wwp_detail', id=wwp_id))
        
    except:
        flash ('Unexpected error has occurred while processing your request','alert-danger')
        db.session.rollback()
        return redirect(url_for('view_wwp'))

@app.route('/deletewwp/<id>', methods=['GET'])
@login_required
@project_required
def delete_wwp(id):
    try:
        wwp = WWP.query.filter_by(id=id).first()
        wwp.is_active= False
        db.session.add(wwp)
        db.session.commit()
        flash('The selected WWP has been deleted successfully','alert-success')
        return redirect(url_for('view_wwps'))
        
    except:
        flash ('Unexpected error has occurred while processing your request','alert-danger')
        db.session.rollback()
        return redirect(url_for('view_wwps'))

@app.route('/updatewwpdetails/<id>', methods=['POST', 'GET'])
def update_wwp_details(id):

    wwp = WWP.query.filter_by(id= id).first()
    form = WWPDetailForm()
    ca = ConstraintAnalysis.query.filter_by(project_id=wwp.project_id, section_id=wwp.section_id, reportingdate_id=wwp.reportingdate_id).first()
    lookahead = LookAhead.query.filter_by(reportingdate_id = wwp.reportingdate_id, section_id= wwp.section_id).first()
    
    #= LookAheadDetail.query.join(ConstraintAnalysisDetail).join(LookAhead, aliased=True).filter_by(section_id==wwp.section_id, constraintanalysis_id==ca.id, ConstraintAnalysisDetail.can_do== True )
    wwp_details = WWPDetail.query.filter_by(wwp_id = wwp.id).all()
    
    
    #print (task_forms)
    if request.method == "POST" :
        activities = wwp_details
        status = getCheckbox(request.form.getlist('status'))
        ppc=0.0
        for s in status:
            if s==True:
                ppc = ppc+1
        ppc = ppc / len(status)
        print (ppc)
        print (status)
        delayreason = request.form.getlist('delayreason')
        print (delayreason)
        for i in range(len(activities)):
            task = WWPDetail.query.filter_by(wwp_id= wwp.id, task_id=activities[i].task_id).first()
            task.status = status[i]
            #print(delayreason[i])
            if delayreason[i] != '__None':
                task.delayreason_id = delayreason[i]
            else:
                task.delayreason_id = None
            task.updated = True
            db.session.add(task)
            db.session.flush()
        wwp.ppc= ppc
        wwp.status = True
        db.session.add(wwp)
        db.session.commit()
        flash("Weekly Work Plan saved successfully!", 'alert-success')
        return redirect(url_for('view_wwp_detail', id=id))
    # except:
    #     flash('An error has occurred while creating the Weekly Work Plan')
    #     return redirect(url_for('view_wwps'))
    return render_template('wwp/wwpdetailsupdate.html', form=form, action='update', wwp = wwp, wwpdetails= wwp_details)
