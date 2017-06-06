'''


'''
from colp import db

class Organisation(db.Model):
	__tablename__ ="organisations"
	id = db.Column(db.Integer, primary_key=True)
	code = db.Column(db.String(80), unique=True)
	name = db.Column(db.String(80))
	description = db.Column(db.Text)
	is_active = db.Column(db.Boolean)

	def __init__(self, code, name, description, is_active=True):
		self.code = code
		self.name = name
		self.description = description
		self.is_active = is_active
		
	def __repr__(self):
		return self.name
	
	