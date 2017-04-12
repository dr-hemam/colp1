from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField
from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from calendars.models import ReportingCycle
from wtforms.ext.sqlalchemy.fields import QuerySelectField


class WWPForm(Form):

    reportingdate = QuerySelectField('Data Date')
    section = QuerySelectField('Section')
    is_active = BooleanField('Active', default= True)


class WWPDetailForm(Form):
    
    task = QuerySelectField('Task', [validators.Required()])
    mon = BooleanField('Mon')
    tue = BooleanField('Tue')
    wed = BooleanField('Wed')
    thu = BooleanField('Thu')
    fri = BooleanField('Fri')
    sat = BooleanField('Sat')
    sun = BooleanField('Sun')
    status = BooleanField('Can', default=True)
    is_active = BooleanField('Active', default=True)