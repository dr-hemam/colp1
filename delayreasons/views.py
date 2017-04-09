from colp import app, db
from delayreasons.form import DelayReasonForm
from delayreasons.models import DelayReason
from flask import render_template, redirect, url_for, request, session
from users.models import User
from users.decorators import *
from organisations.models import Organisation


@app.route('/newreason', methods=['GET', 'POST'])
def new_reason():
    form = DelayReasonForm()
    
    if request.method == "POST" and form.validate() and session.get('organisation_id'):
        user= User.query.filter_by(id= session['user_id']).first()
        org = Organisation.query.filter_by(id= session['organisation_id']).first()
        reason = DelayReason (name= form.name.data, 
                            organisation = org,
                            is_active= True)
        db.session.add(reason)
        db.session.flush()
        db.session.commit()
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
def view_reasons():
    reasons = DelayReason.query.filter_by(is_active=True, org_id=session['organisation_id']).all()
    return render_template('delayreasons/view.html', reasons=reasons)