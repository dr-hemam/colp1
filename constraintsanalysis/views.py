from colp import app, db
from project.models import Project
from flask import render_template, redirect, url_for, request, session, flash
from users.models import User
from users.decorators import *
from constraintsanalysis.models import ConstraintAnalysis, ConstraintAnalysisDetail
from constraintsanalysis.form import ConstraintAnalysisForm, ConstraintAnalysisDetailForm
from calendars.models import ReportingDate
from lookaheads.models import LookAhead, LookAheadDetail
from constraints.models import Constraint
from sections.models import Section
from sqlalchemy import exc, desc


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


@app.route('/newconstraintanalysis', methods=['POST', 'GET'])
@login_required
@project_required
def new_constraintanalysis():
    form = ConstraintAnalysisForm()
    form.reportingdate.query = ReportingDate.query.filter_by(project_id= session.get('project_id'))
    form.section.query = Section.query.filter_by(project_id= session.get('project_id'))
    if request.method == "POST" and form.validate() and session.get('project_id'):
        project = Project.query.filter_by(id=session.get('project_id')).first()
        constraintanalysis = ConstraintAnalysis.query.filter_by(reportingdate_id = form.reportingdate.data.id, 
                                                                project_id= project.id,
                                                                section_id = form.section.data.id).first()
        if not constraintanalysis:
            constraintanalysis = ConstraintAnalysis (project= project, 
                                                    reportingdate= form.reportingdate.data,
                                                    section= form.section.data,
                                                    is_active = form.is_active.data)
        elif constraintanalysis.is_active == False:
            constraintanalysis.is_active = True
        else:
            flash("Error: Duplicate Entry. you can edit or delete existing.", 'alert-danger')
            return redirect(url_for('view_constraintsalysis'))
        try:
            db.session.add(constraintanalysis)
            db.session.flush()
            db.session.commit()
            flash('Constraint analysis has been created successfully', 'alert-success')
            return redirect(url_for('new_constraintanalysis_details', id= constraintanalysis.id))
        except exc.IntegrityError as e:
            db.session.rollback()
            flash("Error: Duplicate Entry. you can edit or delete existing.", 'alert-danger')
            #'return "Error Duplicate Entry"
            return redirect(url_for('new_constraintanalysis'))
    return render_template('constraintsanalysis/constraintanalysisform.html', form=form, action='new')
    

@app.route('/newconstraintanalysisdetails/<id>', methods=['POST', 'GET'])
def new_constraintanalysis_details(id):
    try:
        form = ConstraintAnalysisDetailForm()
        constraintanalysis = ConstraintAnalysis.query.filter_by(id= id).first()
        # get lookahead_id through reporting date id
        lookahead = LookAhead.query.filter_by(reportingdate_id = constraintanalysis.reportingdate_id, section_id= constraintanalysis.section_id).first()
        if not lookahead:
            flash('Lookahead for the same section and reporting date has to be defined before proceeding', 'alert-danger')
            return redirect(url_for('view_constraintsalysis'))
        tasks = LookAheadDetail.query.filter_by(lookahead_id= lookahead.id).all()
        constraints = Constraint.query.filter_by(project_id = session.get('project_id'), is_active=True).all()
        form.task.query = tasks
        form.constraint.query = constraints
        if form.validate_on_submit():
            constraints = Constraint.query.filter_by(project_id = session.get('project_id'), is_active=True).all()
            constraintanalysis = ConstraintAnalysis.query.filter_by(id= id).first()
            checkboxes=[]
            for c in constraints:
                cn = request.form.getlist(str(c.id))
                ccd=[]
                x=0
                while(x <len(cn)):
                    if cn[x]=='No':
                        ccd.append(False)
                        x= x+1
                    else:
                        ccd.append(True)
                        x=x+2
                checkboxes.append(ccd)
            activities = request.form.getlist('task')
            is_actives = request.form.getlist('is_active')
            #statuses = request.form.getlist('status')
            can_dos = getCheckbox(request.form.getlist('can_do'))
            
            for i in range(len(activities)):
                for cnst in range(len(checkboxes)):
                    task = LookAheadDetail.query.filter_by(id=activities[i]).first()
                    cnstanalysis= ConstraintAnalysisDetail (constraintanalysis= constraintanalysis,
                                            task= task, 
                                            constraint= constraints[cnst],
                                            can_do = can_dos[i],
                                            status= checkboxes[cnst][i])
                    db.session.add(cnstanalysis)
            db.session.flush()
            db.session.commit()
            flash('Constraint analysis details added successfully!', 'alert-success')
            return redirect(url_for('view_constraintanalysis_details', id=id))
        return render_template('constraintsanalysis/constraintanalysisdetailsform.html', form=form, action='new', constraintanalysis = constraintanalysis, constraints = constraints, lookahead=lookahead)
    except :
        flash('An error has occured while processing data', 'alert-danger')
        db.session.rollback()
        return redirect(url_for('new_constraintanalysis_details',id=id))

    
        
@app.route('/viewconstraintanalysis')
@login_required
@project_required
def view_constraintsalysis():
    constraintanalysis = ConstraintAnalysis.query.join(ReportingDate).filter(ConstraintAnalysis.project_id==session['project_id'], ConstraintAnalysis.is_active==True)
    constraintanalysis = constraintanalysis.order_by(desc('rdate')).all()
    return render_template('constraintsanalysis/view.html', constraintanalysis=constraintanalysis)
    
@app.route('/viewconstraintanalysisdetails/<id>')
@login_required
@project_required
def view_constraintanalysis_details(id):
    constraintanalysis = ConstraintAnalysis.query.filter_by(id=id).first()
    tasks = ConstraintAnalysisDetail.query.filter_by(constraintanalysis_id=id, is_active=True).group_by(ConstraintAnalysisDetail.task_id)
    cons=[]
    details = ConstraintAnalysisDetail.query.filter_by(constraintanalysis_id=id)
    constraints = Constraint.query.filter_by(project_id = session.get('projectn_id'), is_active=True).all()
    for d in details.all():
        cn = Constraint.query.filter_by(id=d.constraint_id).first()
        if cn not in cons:
            cons.append(cn)
    
    return render_template('constraintsanalysis/viewconstraintanalysis.html', constraintanalysis = constraintanalysis, tasks = tasks, constraints= cons, details = details)
    
@app.route('/deleteconstraintanalysis/<id>')
@login_required
@project_required
def delete_constraintanalysis(id):
    constraintanalysis = ConstraintAnalysis.query.filter_by(id=id).first()
    constraintanalysis.is_active = False
    db.session.add(constraintanalysis)
    tasks=ConstraintAnalysisDetail.query.filter_by(constraintanalysis_id=constraintanalysis.id, is_active=True).all()
    for t in tasks:
        t.is_active=False
        db.session.add(t)
    
    db.session.commit()
    flash('The selected constraint analysis has been delete successully', 'alert-success')
    return redirect(url_for('view_constraintsalysis'))
    
@app.route('/deletecadetail', methods=['GET'])
def delete_constraintanalysis_detail():
    try:
        t_id= request.args.get('task_id')
        ca_id= request.args.get('ca_id')
        catask = ConstraintAnalysisDetail.query.filter_by(task_id= t_id, constraintanalysis_id = ca_id).all()
        
        for c in catask:
            c.is_active= False
            db.session.add(c)
            
        db.session.commit()
        flash('Activity has been deleted successfull from constraint analysis','alert-success')
    except:
        db.session.rollbak()
        flash('An error has occurred in the deletion process.', 'alert-danger')
    return redirect(url_for('view_constraintanalysis_details', id= ca_id))
    
@app.route('/editcadetail', methods=['GET', 'POST'])
def edit_constraintanalysis_detail():
    t_id= request.args.get('task_id')
    ca_id= request.args.get('ca_id')
    catask = ConstraintAnalysisDetail.query.filter_by(task_id= t_id, constraintanalysis_id = ca_id, is_active=True).all()
    task = LookAheadDetail.query.filter_by(id=t_id).first()
    constraints = Constraint.query.filter_by(project_id=session.get('project_id'), is_active=True).all()
    # get lookahead_id through reporting date id
    constraintanalysis = ConstraintAnalysis.query.filter_by(id= ca_id).first()
    form = ConstraintAnalysisDetailForm()
    if request.method=='POST':
        
        checkboxes=[]
        for c in constraints:
            cn = request.form.getlist(str(c.id))
            ccd=[]
            x=0
            while(x <len(cn)):
                if cn[x]=='No':
                    ccd.append(False)
                    x= x+1
                else:
                    ccd.append(True)
                    x=x+2
            checkboxes.append(ccd)
        is_actives = getCheckbox(request.form.getlist('is_active'))
        can_dos = (len(request.form.getlist('can_do')) >1)
        i=0
        for c in catask:
            if i < len(checkboxes):
                c.status = checkboxes[i][0]
                c.can_do = can_dos
                c.is_active = is_actives[0]
                db.session.add(c)
                print(checkboxes, c.status, c.can_do)
                i+=1 
            else:
                pass
            
            
        db.session.commit()
        flash('Constraint analysis details added successfully!', 'alert-success')
        return redirect(url_for('view_constraintanalysis_details', id=constraintanalysis.id))
    return render_template('constraintsanalysis/editcadetail.html', form=form, action='edit', task=task, constraintanalysis = constraintanalysis, constraints = constraints)
    
        
    