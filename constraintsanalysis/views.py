from colp import app, db
from project.models import Project
from flask import render_template, redirect, url_for, request, session
from users.models import User
from users.decorators import *
from constraintsanalysis.models import ConstraintAnalysis, ConstraintAnalysisDetail
from constraintsanalysis.form import ConstraintAnalysisForm, ConstraintAnalysisDetailForm
from calendars.models import ReportingDate
from lookaheads.models import LookAhead, LookAheadDetail
from constraints.models import Constraint

@app.route('/newconstraintanalysis', methods=['POST', 'GET'])
@login_required
@project_required
def new_constraintanalysis():
    form = ConstraintAnalysisForm()
    form.reportingdate.query = ReportingDate.query.filter_by(project_id= session.get('project_id'))
    if request.method == "POST" and form.validate() and session.get('project_id'):
        project = Project.query.filter_by(id=session.get('project_id')).first()
        constraintanalysis = ConstraintAnalysis (project= project, 
                                                reportingdate= form.reportingdate.data )
        db.session.add(constraintanalysis)
        db.session.flush()
        db.session.commit()
        return redirect(url_for('new_constraintanalysis_details', id= constraintanalysis.id))
    return render_template('constraintsanalysis/constraintanalysisform.html', form=form, action='new')
    

@app.route('/newconstraintanalysisdetails/<id>', methods=['POST', 'GET'])
def new_constraintanalysis_details(id):
    form = ConstraintAnalysisDetailForm()
    if request.method == "POST":
        constraints = Constraint.query.filter_by(org_id = session.get('organisation_id'), is_active=True).all()
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
        statuses = request.form.getlist('status')
        return (str(activities) + str(is_actives) + str(statuses)+str(checkboxes))
    constraintanalysis = ConstraintAnalysis.query.filter_by(id= id).first()
    # get lookahead_id through reporting date id
    lookahead = LookAhead.query.filter_by(reportingdate_id = constraintanalysis.reportingdate_id).first()
    tasks = LookAheadDetail.query.filter_by(lookahead_id= lookahead.id).all()
    constraints = Constraint.query.filter_by(org_id = session.get('organisation_id'), is_active=True).all()
    form.task.query = tasks
    return render_template('constraintsanalysis/constraintanalysisdetailsform.html', form=form, action='new', constraintanalysis = constraintanalysis, constraints = constraints)
        
# @app.route('/viewlookaheads')
# @login_required
# @project_required
# def view_lookaheads():
#     lookaheads = LookAhead.query.filter_by(project_id=session['project_id']).all()
#     print('lookaheads', lookaheads)
#     return render_template('lookaheads/view.html', lookaheads=lookaheads)
    
# @app.route('/viewlookahead/<id>')
# @login_required
# @project_required
# def view_lookahead(id):
#     lookahead = LookAhead.query.filter_by(id=id).first()
#     details = LookAheadDetail.query.filter_by(lookahead_id=id).all()
#     return render_template('lookaheads/viewlookahead.html', lookahead = lookahead, tasks = details)