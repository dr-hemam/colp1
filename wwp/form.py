from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField
from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from calendars.models import ReportingCycle
from wtforms.ext.sqlalchemy.fields import QuerySelectField
from delayreasons.models import DelayReason
from flask import session

class WWPForm(Form):

    reportingdate = QuerySelectField('Data Date')
    section = QuerySelectField('Section')
    is_active = BooleanField('Active', default= True)


class WWPDetailForm(Form):
    
    def delay_reasons():
        return DelayReason.query.filter_by(org_id= session.get('organisation_id'))
    
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
    delayreason = QuerySelectField('Delay Reason', query_factory=delay_reasons, allow_blank=True)