'''


'''
from colp import db

class Constraint(db.Model):
	__tablename__ ="constraints"
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(80))
	org_id = db.Column(db.Integer, db.ForeignKey('organisations.id'))
	organisation= db.relationship('Organisation', backref='constraints')
	is_active = db.Column(db.Boolean)

	def __init__(self, name, organisation, is_active=True):
		self.name = name
		self.org_id= organisation.id
		self.is_active= is_active
		
	def __repr__(self):
		return self.name
	
	