'''


'''
from colp import db

class Section(db.Model):
	__tablename__ ="sections"
	id = db.Column(db.Integer, primary_key=True)
	code = db.Column(db.String(80), unique=True)
	name = db.Column(db.String(80))
	project_id = db.Column(db.Integer, db.ForeignKey('projects.id'))
	project= db.relationship('Project', backref='section')
	active = db.Column(db.Boolean)

	def __init__(self, code, name, project, active=True):
		self.code = code
		self.name = name
		self.active = active
		self.project_id = project.id
		
	def __repr__(self):
		return self.name
	
	