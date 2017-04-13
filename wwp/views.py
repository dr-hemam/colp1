from colp import app, db
from project.models import Project
from flask import render_template, redirect, url_for, request, session
from users.models import User
from users.decorators import *
from wwp.models import WWP, WWPDetail
from wwp.form import WWPForm, WWPDetailForm
from calendars.models import ReportingDate
from constraints.models import Constraint
from sections.models import Section
from lookaheads.models import LookAheadDetail
from constraintsanalysis.models import ConstraintAnalysis, ConstraintAnalysisDetail

@app.route('/newwwp', methods=['POST', 'GET'])
@login_required
@project_required
def new_wwp():
    form =WWPForm()
    form.reportingdate.query = ReportingDate.query.filter_by(project_id= session.get('project_id'))
    form.section.query = Section.query.filter_by(project_id= session.get('project_id'))
    if request.method == "POST" and form.validate() and session.get('project_id'):
        project = Project.query.filter_by(id=session.get('project_id')).first()
        wwp = WWP (project= project,
                    reportingdate= form.reportingdate.data,
                    section= form.section.data,
                    is_active = form.is_active.data)
        db.session.add(wwp)
        db.session.flush()
        db.session.commit()
        return ("Added Sussefully!")
    return render_template('wwp/wwpform.html', form=form, action='new')
    

@app.route('/newwwpdetails/<id>', methods=['POST', 'GET'])
def new_wwp_details(id):
    form = WWPDetailForm()
    if request.method == "POST":
        constraints = Constraint.query.filter_by(org_id = session.get('organisation_id'), is_active=True).all()
        constraintanalysis = ConstraintAnalysis.query.filter_by(id= id).first()
        
        activities = request.form.getlist('task')
        is_actives = request.form.getlist('is_active')
        #statuses = request.form.getlist('status')
        can_dos = request.form.getlist('can_do')
        print(str(can_dos), str(len(activities)))
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
    wwp = WWP.query.filter_by(id= id).first()
    
    ca = ConstraintAnalysis.query.filter_by(project_id=wwp.project_id, section_id=wwp.section_id, reportingdate_id=wwp.reportingdate_id).first()
    
    form.task.query = LookAheadDetail.query.join(ConstraintAnalysisDetail).filter(ConstraintAnalysisDetail.can_do== True and constraintanalysis_id==ca.id)
    return render_template('wwp/wwpdetails.html', form=form, action='new', wwp = wwp)
        
"""   
@app.route('/viewconstraintanalysisdetails/<id>')
@login_required
@project_required
def view_constraintanalysis_details(id):
    constraintanalysis = ConstraintAnalysis.query.filter_by(id=id).first()
    tasks = ConstraintAnalysisDetail.query.filter_by(constraintanalysis_id=id).group_by(ConstraintAnalysisDetail.task_id)
    constraints = Constraint.query.filter_by(org_id = session.get('organisation_id'), is_active=True).all()
    details =ConstraintAnalysisDetail.query.filter_by(constraintanalysis_id=id)
    return render_template('constraintsanalysis/viewconstraintanalysis.html', constraintanalysis = constraintanalysis, tasks = tasks, constraints= constraints, details = details)
    
"""