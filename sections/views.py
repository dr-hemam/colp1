from colp import app, db
from sections.form import SectionForm
from project.models import Project
from flask import render_template, redirect, url_for, request, session
from users.models import User
from users.decorators import *
from sections.models import Section

@app.route('/newsection', methods=['POST', 'GET'])
@login_required
@project_required
def new_section():
    form = SectionForm()
    print(session['project_id'])
    if request.method == "POST" and form.validate() and session.get('project_id'):
        
        section = Section (code= form.code.data, 
                            name= form.name.data, 
                            project= Project.query.filter_by(id=session['project_id']).first(),
                            active= form.active.data)
        db.session.add(section)
        db.session.flush()
        db.session.commit()
        return redirect(url_for('view_sections'))
    return render_template('sections/sectionform.html', form=form, action='new')
    
    
@app.route('/viewsections')
@login_required
@project_required
def view_sections():
    sections = Section.query.filter_by(project_id=session['project_id']).all()
    print (sections)
    return render_template('sections/view.html', sections=sections)
    
@app.route('/viewsection/<id>')
@login_required
@project_required
def section_details(id):
    section = Section.query.filter_by(id= id, project_id= session['project_id']).first()
    return render_template('sections/details.html', section=section)


@app.route('/editsection/<id>', methods=['GET', 'POST'])
@login_required
@project_required
def edit_section(id):
    section = Section.query.filter_by(id= id).first()
    form = SectionForm(obj= section)
    
    if request.method == "POST" and form.validate():
        section.code = form.code.data
        section.name = form.name.data
        section.active = form.active.data
        
        db.session.add(section)
        db.session.flush()
        db.session.commit()
        return redirect(url_for('view_sections'))
    return render_template('sections/sectionform.html', form = form, section=section, action='edit')