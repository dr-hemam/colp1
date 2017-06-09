from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField
from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from calendars.models import ReportingCycle
from wtforms.ext.sqlalchemy.fields import QuerySelectField
from delayreasons.models import DelayReason
from flask import session
from users.models import User

class WWPForm(Form):

    reportingdate = QuerySelectField('Data Date')
    section = QuerySelectField('Section')
    is_active = BooleanField('Active', default= True)


class WWPDetailForm(Form):
    
    def get_users():
        return User.query.filter_by(organisation_id=session.get('organisation_id'))
        
    def delay_reasons():
        return DelayReason.query.filter_by(project_id= session.get('project_id'))
    
    task = QuerySelectField('Task', [validators.Required()])
    user = QuerySelectField('User', query_factory= get_users, allow_blank=True)
    mon = BooleanField('Mon')
    tue = BooleanField('Tue')
    wed = BooleanField('Wed')
    thu = BooleanField('Thu')
    fri = BooleanField('Fri')
    sat = BooleanField('Sat')
    sun = BooleanField('Sun')
    status = BooleanField('Can', default=True)
    is_active = BooleanField('Active', default=True)
    delayreason = QuerySelectField('Delay Reason', query_factory=delay_reasons, allow_blank=True)