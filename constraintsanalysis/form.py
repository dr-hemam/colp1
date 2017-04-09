from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField
from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from calendars.models import ReportingCycle
from wtforms.ext.sqlalchemy.fields import QuerySelectField


class ConstraintAnalysisForm(Form):

    reportingdate = QuerySelectField('Data Date')
    is_active = BooleanField('Active', default= True)


class ConstraintAnalysisDetailForm(Form):
    
    task = QuerySelectField('Task', [validators.Required()])
    constraint = QuerySelectField('Constraint', [validators.Required()])
    status = BooleanField('Can', default=True)
    is_active = BooleanField('Active', default=True)