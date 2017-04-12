from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField
from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from wtforms.ext.sqlalchemy.fields import QuerySelectField
from users.models import User
from users.form import RegisterForm

class OrganisationForm(RegisterForm):
    
    def get_users():
        return User.query
    
    code = StringField('Code', [validators.Required()])
    name= StringField('Organisation Name', [validators.Required()])
    description = TextAreaField ('Description', [validators.Required()])
    is_active = BooleanField('Active', default=True)
