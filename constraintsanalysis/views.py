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


@app.route('/newconstraintanalysis', methods=['POST', 'GET'])
@login_required
@project_required
def new_constraintanalysis():
    form = ConstraintAnalysisForm()
    form.reportingdate.query = ReportingDate.query.filter_by(project_id= session.get('project_id'))
    form.section.query = Section.query.filter_by(project_id= session.get('project_id'))
    if request.method == "POST" and form.validate() and session.get('project_id'):
        project = Project.query.filter_by(id=session.get('project_id')).first()
        constraintanalysis = ConstraintAnalysis (project= project, 
                                                reportingdate= form.reportingdate.data,
                                                section= form.section.data,
                                                is_active = form.is_active.data)
        try:
            db.session.add(constraintanalysis)
            db.session.flush()
            db.session.commit()
            return redirect(url_for('new_constraintanalysis_details', id= constraintanalysis.id))
        except exc.IntegrityError as e:
            db.session.rollback()
            flash("Error: Duplicate Entry. you can edit or delete existing.", 'alert-danger')
            #'return "Error Duplicate Entry"
            return redirect(url_for('new_constraintanalysis'))
    return render_template('constraintsanalysis/constraintanalysisform.html', form=form, action='new')
    

@app.route('/newconstraintanalysisdetails/<id>', methods=['POST', 'GET'])
def new_constraintanalysis_details(id):
    form = ConstraintAnalysisDetailForm()
    constraintanalysis = ConstraintAnalysis.query.filter_by(id= id).first()
    # get lookahead_id through reporting date id
    lookahead = LookAhead.query.filter_by(reportingdate_id = constraintanalysis.reportingdate_id, section_id= constraintanalysis.section_id).first()
    tasks = LookAheadDetail.query.filter_by(lookahead_id= lookahead.id).all()
    constraints = Constraint.query.filter_by(org_id = session.get('organisation_id'), is_active=True).all()
    form.task.query = tasks
    form.constraint.query = constraints
    print(form, form.validate(), form.errors.items())
    if form.validate_on_submit():
        print('validated')
        constraints = Constraint.query.filter_by(org_id = session.get('organisation_id'), is_active=True).all()
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

    return render_template('constraintsanalysis/constraintanalysisdetailsform.html', form=form, action='new', constraintanalysis = constraintanalysis, constraints = constraints, lookahead=lookahead)
        
@app.route('/viewconstraintanalysis')
@login_required
@project_required
def view_constraintsalysis():
    constraintanalysis = ConstraintAnalysis.query.join(ReportingDate).filter_by(project_id=session['project_id'], is_active=True)
    constraintanalysis = constraintanalysis.order_by(desc('rdate')).all()
    return render_template('constraintsanalysis/view.html', constraintanalysis=constraintanalysis)
    
@app.route('/viewconstraintanalysisdetails/<id>')
@login_required
@project_required
def view_constraintanalysis_details(id):
    constraintanalysis = ConstraintAnalysis.query.filter_by(id=id).first()
    tasks = ConstraintAnalysisDetail.query.filter_by(constraintanalysis_id=id).group_by(ConstraintAnalysisDetail.task_id)
    constraints = Constraint.query.filter_by(org_id = session.get('organisation_id'), is_active=True).all()
    details =ConstraintAnalysisDetail.query.filter_by(constraintanalysis_id=id)
    return render_template('constraintsanalysis/viewconstraintanalysis.html', constraintanalysis = constraintanalysis, tasks = tasks, constraints= constraints, details = details)