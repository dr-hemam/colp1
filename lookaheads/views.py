from colp import app, db
from project.models import Project
from flask import render_template, redirect, url_for, request, session, flash
from users.models import User
from users.decorators import *
from lookaheads.models import LookAhead, LookAheadDetail
from lookaheads.form import LookAheadForm, LookAheadDetailForm
from calendars.models import ReportingDate
from sections.models import Section
from sqlalchemy import exc, desc
from wtforms import validators


@app.route('/newlookahead', methods=['POST', 'GET'])
@login_required
@project_required
def new_lookahead():
    form = LookAheadForm()
    form.reportingdate.query = ReportingDate.query.filter_by(project_id= session.get('project_id'))
    form.section.query = Section.query.filter_by(project_id= session.get('project_id'))
    if request.method == "POST" and form.validate() and session.get('project_id'):
        project = Project.query.filter_by(id=session.get('project_id')).first()
        lookahead = LookAhead (project= project, 
                                reportingdate= form.reportingdate.data,
                                section = form.section.data,
                                is_active = form.section.data)
        try:
            db.session.add(lookahead)
            db.session.flush()
            db.session.commit()
        except exc.IntegrityError as e:
            db.session.rollback()
            flash("Error Duplicate Entry")
            return redirect(url_for('new_lookahead'))
        return redirect(url_for('new_lookahead_details', id= lookahead.id))
    return render_template('lookaheads/lookaheadform.html', form=form, action='new')
    

@app.route('/newlooaheaddetails/<id>', methods=['POST', 'GET'])
def new_lookahead_details(id):
    form = LookAheadDetailForm()
    lookaheadmain = LookAhead.query.filter_by(id= id).all()
    form.lookahead.query = lookaheadmain
    
    if request.method == "POST":
        codes = request.form.getlist('task_code')
        names = request.form.getlist('task_name')
        starts = request.form.getlist('start')
        finishs = request.form.getlist('finish')
        is_actives = request.form.getlist('is_active')
        for i in range(len(codes)):
            task = LookAheadDetail(lookahead = lookaheadmain[0],
                                    code= codes[i], 
                                    name= names[i], 
                                    start= starts[i], 
                                    finish= finishs[i], 
                                    is_active= is_actives[i])
            try:
                db.session.add(task)
                db.session.commit()
            except exc.IntegrityError as e:
                db.session.rollback()
        
        return redirect(url_for('view_lookahead', id=id))
    return render_template('lookaheads/lookaheaddetailsform.html', form=form, action='new', lookahead = lookaheadmain[0])
        
@app.route('/editlhdetail/<tid>', methods=['GET', 'POST'])
@login_required
@project_required
def edit_lookahead_detail(tid):
    task = LookAheadDetail.query.filter_by(id= tid).first()
    form = LookAheadDetailForm(obj= task)
    lookaheadmain = LookAhead.query.filter_by(id= task.lookahead_id).all()
    form.lookahead.query = lookaheadmain
    print ("Before Validate", form)
    
    
    if form.validate_on_submit():
        task.task_code = form.task_code.data
        task.start = form.start.data
        task.finish = form.finish.data
        task.task_name = form.task_name.data
        task.is_active= form.is_active.data
        
        db.session.add(task)
        db.session.flush()
        db.session.commit()
        flash('Task has been edited successfully')
        return redirect(url_for('view_lookahead',id= task.lookahead_id))
    return render_template('lookaheads/lookaheaddetailsform.html', form = form, task=task, action='edit')
    
@app.route('/editlookaheaddetails/<id>', methods=['GET','POST'])
def edit_lookahead_details(id):
    
    form = LookAheadDetailForm()
    lookaheadmain = LookAhead.query.filter_by(id= id).all()
    form.lookahead.query = lookaheadmain
    tasks = LookAheadDetail.query.filter_by(lookahead_id= id).all()
    forms=[]
    for task in tasks:
        form = LookAheadDetailForm(obj= task)
        forms.append(form)
    
    if request.method == "POST":
        codes = request.form.getlist('task_code')
        names = request.form.getlist('task_name')
        starts = request.form.getlist('start')
        finishs = request.form.getlist('finish')
        is_actives = request.form.getlist('is_active')
        for i in range(len(codes)):
            if i<len(tasks):
                if tasks[i]:
                    task = LookAheadDetail.query.filter_by(id=tasks[i].id).first()
                    task.code = codes[i]
                    task.name = names[i]
                    db.session.commit()
                    tasks[i].start= starts[i]
                    tasks[i].finish= finishs[i]
                    tasks[i].is_active= is_actives[i]
            else:
                task = LookAheadDetail(lookahead = lookaheadmain[0],
                                    code= codes[i], 
                                    name= names[i], 
                                    start= starts[i], 
                                    finish= finishs[i], 
                                    is_active= is_actives[i])
                db.session.add(task)
                db.session.commit()
                
        # try:
        #     db.session.commit()
        # except exc.IntegrityError as e:
        #     flash ('An Error has occured while trying to save changes')
        #     print (e)
        #     db.session.rollback()
        
        return redirect(url_for('view_lookahead', id=id))
    
    
    
    return render_template('lookaheads/editlhdetails.html', forms=forms, lookahead=lookaheadmain[0])
    
@app.route('/viewlookaheads')
@login_required
@project_required
def view_lookaheads():
    lookaheads = LookAhead.query.join(ReportingDate).filter_by(project_id=session['project_id'])
    lookaheads = lookaheads.order_by(desc('rdate')).all()
    print('lookaheads', lookaheads)
    return render_template('lookaheads/view.html', lookaheads=lookaheads)
    
@app.route('/viewlookahead/<id>')
@login_required
@project_required
def view_lookahead(id):
    lookahead = LookAhead.query.filter_by(id=id).first()
    details = LookAheadDetail.query.filter_by(lookahead_id=id).all()
    return render_template('lookaheads/viewlookahead.html', lookahead = lookahead, tasks = details)