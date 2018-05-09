from colp import app, db
from constraints.form import ConstraintForm
from constraints.models import Constraint
from flask import render_template, redirect, url_for, request, session
from users.models import User
from users.decorators import *
from organisations.models import Organisation
from project.models import Project


@app.route('/newconstraint', methods=['GET', 'POST'])
@login_required
@project_required
def new_constraint():
    form = ConstraintForm()
    if request.method == "POST" and form.validate() and session.get('project_id'):
        constraint = Constraint.query.filter_by(name=form.name.data, project_id= session.get('project_id')).first()
        if not constraint:
            project = Project.query.filter_by(id= session['project_id']).first()
            constraint = Constraint (name= form.name.data, 
                                project = project,
                                is_active= True)
        else:
            
            if constraint.is_active==False:
                constraint.is_active=True
            else:
                flash('The constraint ' + form.name.data + ' already defined for the active project','alert-danger')
                return redirect(url_for('view_constraints'))
        try:
            db.session.add(constraint)
            db.session.flush()
            db.session.commit()
            flash('Constraint has been created successfully', 'alert-success')
        except:
            flash('An unexpected error occurred', 'alert-danger')
        return redirect(url_for('view_constraints'))
    return render_template('constraints/setup.html', form=form, action='new')
    
@app.route('/editconstraint/<id>', methods=['GET', 'POST'])
@login_required
def edit_constraint(id):
    constraint = Constraint.query.filter_by(id= id).first()
    form = ConstraintForm(obj= constraint)
    
    if request.method == "POST" and form.validate():
        
        try:
            constraint.name = form.name.data
            constraint.is_active = form.is_active.data
            
            db.session.add(constraint)
            db.session.flush()
            db.session.commit()
            flash('Constraint has been edited successfully', 'alert-success')
        except:
            flash('An unexpected error occurred', 'alert-danger')
            db.session.rollback()
        return redirect(url_for('view_constraints'))
    return render_template('constraints/setup.html', form = form, constraint=constraint, action='edit')

@app.route('/viewconstraints')
@login_required
def view_constraints():
    constraints = Constraint.query.filter_by(is_active=True, project_id=session['project_id']).all()
    return render_template('constraints/view.html', constraints=constraints)