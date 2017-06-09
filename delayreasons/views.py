from colp import app, db
from delayreasons.form import DelayReasonForm
from delayreasons.models import DelayReason
from flask import render_template, redirect, url_for, request, session, flash
from users.models import User
from users.decorators import *
from organisations.models import Organisation
from project.models import Project
from sqlalchemy import exc


@app.route('/newreason', methods=['GET', 'POST'])
def new_reason():
    form = DelayReasonForm()
    
    if request.method == "POST" and form.validate() and session.get('project_id'):
        reason = DelayReason.query.filter_by(name= form.name.data, project_id=session.get('project_id')).first()
        if not reason:
            user= User.query.filter_by(id= session['user_id']).first()
            project = Project.query.filter_by(id= session['project_id']).first()
            reason = DelayReason (name= form.name.data, 
                                project = project,
                                is_active= True)
        else:
            reason.is_active=True
        try:
            db.session.add(reason)
            db.session.flush()
            db.session.commit()
            flash('Delay reason has been added successfully', 'alert-success')
            return redirect(url_for('view_reasons'))
        except exc.IntegrityError:
            
            flash('The delay reason ' + form.name.data + ' already exist for the current project')
            db.session.rollback()
                
            return redirect(url_for('view_reasons'))
    return render_template('delayreasons/setup.html', form=form, action='new')
    
@app.route('/editreason/<id>', methods=['GET', 'POST'])
@login_required
def edit_reason(id):
    reason = DelayReason.query.filter_by(id= id).first()
    form = DelayReasonForm(obj= reason)
    
    if request.method == "POST" and form.validate():
        reason.name = form.name.data
        reason.is_active = form.is_active.data
        
        db.session.add(reason)
        db.session.flush()
        db.session.commit()
        return redirect(url_for('view_reasons'))
    return render_template('delayreasons/setup.html', form = form, reason=reason, action='edit')

@app.route('/viewreasons')
@login_required
@project_required
def view_reasons():
    reasons = DelayReason.query.filter_by(is_active=True, project_id=session['project_id']).all()
    return render_template('delayreasons/view.html', reasons=reasons)
    
@app.route('/deletereason/<id>')
def delete_reason(id):
    reason = DelayReason.query.filter_by(id=id).first()
    reason.is_active= False
    try:
        db.session.add(reason)
        db.session.flush()
        db.session.commit()
    except Exception as e:
        print(e)
        flash('An error occurred during deleting the delay cause category', 'alert-danger')
        return redirect(url_for('view_reasons'))
    flash('The delay cause category has been deleted successfully!', 'alert-success')
    return redirect(url_for('view_reasons'))