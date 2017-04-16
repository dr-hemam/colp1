from flask_wtf import Form
from wtforms import validators, StringField, BooleanField

class ConstraintForm(Form):

    name= StringField('Constraint Description', [validators.Required()])
    is_active = BooleanField('Active', default=True)