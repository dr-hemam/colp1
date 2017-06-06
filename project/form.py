from flask_wtf import Form
from wtforms import validators, StringField, PasswordField, TextAreaField, BooleanField
from wtforms.fields.html5 import DateField
from wtforms.fields.html5 import EmailField
from calendars.models import ReportingCycle
from wtforms.ext.sqlalchemy.fields import QuerySelectField


# class DatesValidation(object):
    
#     def __init__(self, start, message=None):
#         self.start= start
#         if not message:
#             message='End date must be later than start date'
#         self.message= message
#     def __call__(self, form, field):
#         if self.start > field.data:
#             raise validators.ValidationError(self.message)

class ProjectSetupForm(Form):
    
    def get_cycles():
        return ReportingCycle.query
    
    
    
        
    
    code = StringField('Code', [validators.Required()])
    name= StringField('Project Name', [validators.Required()])
    description = TextAreaField ('Description', [validators.Required()])
    start = DateField('Start Date', [validators.Required()])
    finish = DateField('Finish Date', [validators.Required()])
    #owner = QuerySelectField('users', query_factory= get_user)
    
    cycle = QuerySelectField('Reporting Cycle', query_factory= get_cycles, allow_blank=True)
    status = BooleanField('Active', default=True)



    def validate(self):
        if not Form.validate(self):
            return False
            
        message = "Finish date must be later than start date"
        
        if self.finish.data <self.start.data:
            raise validators.ValidationError(message)
        return True
        