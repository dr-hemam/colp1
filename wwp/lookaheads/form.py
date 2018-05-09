from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField, DateField
#from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from calendars.models import ReportingCycle
from wtforms.ext.sqlalchemy.fields import QuerySelectField




class LookAheadForm(Form):
    
    def get_cycles():
        return ReportingCycle.query
    reportingdate = QuerySelectField('Data Date')
    section = QuerySelectField('Section')
    is_active = BooleanField('Active', default=True)


class LookAheadDetailForm(Form):
    
    lookahead = QuerySelectField('Reporting Data Date', [validators.Required()])
    task_code = StringField('Task ID', [validators.Required()])
    task_name = StringField('Task Description', [validators.Required()])
    start = DateField('Start Date', [validators.Required()], format="%Y-%m-%d")
    finish = DateField('Finish Date', [validators.Required()])
    is_active = BooleanField('Active', default=True)