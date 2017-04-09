from flask_wtf import Form
from wtforms import validators, StringField, BooleanField

class DelayReasonForm(Form):

    name= StringField('Reason for Delay', [validators.Required()])
    is_active = BooleanField('Active')