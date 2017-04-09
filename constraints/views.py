from colp import app, db
from constraints.form import ConstraintForm
from constraints.models import Constraint
from flask import render_template, redirect, url_for, request, session
from users.models import User
from users.decorators import *
from organisations.models import Organisation


@app.route('/newconstraint', methods=['GET', 'POST'])
def new_constraint():
    form = ConstraintForm()
    if request.method == "POST" and form.validate() and session.get('organisation_id'):
        org = Organisation.query.filter_by(id= session['organisation_id']).first()
        constraint = Constraint (name= form.name.data, 
                            organisation = org,
                            is_active= True)
        db.session.add(constraint)
        db.session.flush()
        db.session.commit()
        return redirect(url_for('view_constraints'))
    return render_template('constraints/setup.html', form=form, action='new')
    
@app.route('/editconstraint/<id>', methods=['GET', 'POST'])
@login_required
def edit_constraint(id):
    constraint = Constraint.query.filter_by(id= id).first()
    form = ConstraintForm(obj= constraint)
    
    if request.method == "POST" and form.validate():
        constraint.name = form.name.data
        constraint.is_active = form.is_active.data
        
        db.session.add(constraint)
        db.session.flush()
        db.session.commit()
        return redirect(url_for('view_constraints'))
    return render_template('constraints/setup.html', form = form, constraint=constraint, action='edit')

@app.route('/viewconstraints')
def view_constraints():
    constraints = Constraint.query.filter_by(is_active=True, org_id=session['organisation_id']).all()
    return render_template('constraints/view.html', constraints=constraints)