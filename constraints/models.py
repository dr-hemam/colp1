'''


'''
from colp import db

class Constraint(db.Model):
	__tablename__ ="constraints"
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(80))
	project_id = db.Column(db.Integer, db.ForeignKey('projects.id'))
	project = db.relationship('Project', backref='constraints')
	is_active = db.Column(db.Boolean)
	
	__table_args__ = (
		db.UniqueConstraint('name', 'project_id', name='uix_cnst1'),
	)
	
	def __init__(self, name, project, is_active=True):
		self.name = name
		self.project_id= project.id
		self.is_active= is_active
		
	def __repr__(self):
		return self.name
	
	