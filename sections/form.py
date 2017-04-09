from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField
from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from calendars.models import ReportingCycle
from wtforms.ext.sqlalchemy.fields import QuerySelectField




class SectionForm(Form):
    
    def get_cycles():
        return ReportingCycle.query
    
    code = StringField('Code', [validators.Required()])
    name= StringField('Section Name', [validators.Required()])
    active = BooleanField('Active')
