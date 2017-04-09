'''


'''
from colp import db

class DelayReason(db.Model):
	__tablename__ ="delay_reasons"
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(80))
	org_id = db.Column(db.Integer, db.ForeignKey('organisations.id'))
	organisation= db.relationship('Organisation', backref='delayreasons')
	is_active = db.Column(db.Boolean)

	def __init__(self, name, organisation, is_active=True):
		self.name = name
		self.org_id= organisation.id
		self.is_active= is_active
		
	def __repr__(self):
		return self.name
	
	