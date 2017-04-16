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
from lookaheads.models import LookAheadDetail
from constraintsanalysis.models import ConstraintAnalysis, ConstraintAnalysisDetail
from sqlalchemy import exc

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
            flash ("Added Sussefully! please create details of your weekly work plan")
            return redirect(url_for('new_wwp_details', id= wwp.id))
        except exc.IntegrityError as e:
            db.session.rollback()
            flash('Error: Duplicate Entry. you can edit or delete existing.')
    return render_template('wwp/wwpform.html', form=form, action='new')
    

@app.route('/newwwpdetails/<id>', methods=['POST', 'GET'])
def new_wwp_details(id):
    form = WWPDetailForm()
    wwp = WWP.query.filter_by(id= id).first()
    ca = ConstraintAnalysis.query.filter_by(project_id=wwp.project_id, section_id=wwp.section_id, reportingdate_id=wwp.reportingdate_id).first()
    form.task.query = LookAheadDetail.query.join(ConstraintAnalysisDetail).filter(ConstraintAnalysisDetail.can_do== True and constraintanalysis_id==ca.id)

    if request.method == "POST" and form.validate():
        constraints = Constraint.query.filter_by(org_id = session.get('organisation_id'), is_active=True).all()
        constraintanalysis = ConstraintAnalysis.query.filter_by(id= id).first()
        
        activities = request.form.getlist('task')
        is_actives = request.form.getlist('is_active')
        #statuses = request.form.getlist('status')
        can_dos = request.form.getlist('can_do')
        for i in range(len(activities)):
            for cnst in range(len(checkboxes)):
                task = LookAheadDetail.query.filter_by(id=activities[i]).first()
                cnstanalysis= ConstraintAnalysisDetail (constraintanalysis= constraintanalysis,
                                        task= task, 
                                        constraint= constraints[cnst],
                                        can_do = can_dos[i],
                                        status= checkboxes[cnst][i])
                db.session.add(cnstanalysis)
        db.session.commit()
        return redirect(url_for('view_constraintanalysis_details', id=id))
    return render_template('wwp/wwpdetails.html', form=form, action='new', wwp = wwp)
   
@app.route('/viewwwp')
@login_required
@project_required
def view_wwps():
    wwp= WWP.query.filter_by(project_id=session.get('project_id')).all()
    return render_template('wwp/view_wwps.html', wwp=wwp)
    
@app.route('/viewwwpdetail/<id>')
@login_required
@project_required
def view_wwp_detail(id):
    wwp= WWP.query.filter_by(id=id).first()
    wwpdetail = WWPDetail.query.filter_by(wwp_id=wwp.id).all()
    try:
        print (wwwpdetail)
    except:
        print ("exception")
    return wwp
    #return render_template('wwp/view_wwps.html', wwp=wwp)