from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField
from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from calendars.models import ReportingCycle
from wtforms.ext.sqlalchemy.fields import QuerySelectField




class SectionForm(Form):
    
    code = StringField('Code', [validators.Required()])
    name= StringField('Section Name', [validators.Required()])
    parent = QuerySelectField('Parent', allow_blank=True)
    active = BooleanField('Active', default=True)
