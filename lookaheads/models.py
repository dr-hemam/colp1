'''


'''
from colp import db
from datetime import datetime


class LookAhead(db.Model):
	__tablename__ ="lookaheads"
	id = db.Column(db.Integer, primary_key=True)
	project_id = db.Column(db.Integer, db.ForeignKey('projects.id'))
	project= db.relationship('Project', backref='lookahead')
	reportingdate_id = db.Column(db.Integer, db.ForeignKey('reportingdates.id'))
	reportingdate= db.relationship('ReportingDate', backref='lookahead')
	is_active = db.Column(db.Boolean)

	def __init__(self, project, reportingdate, is_active=True):
		self.is_active = is_active
		self.project_id = project.id
		self.reportingdate = reportingdate
		self.reportingdate_id= reportingdate.id
		
	def __repr__(self):
		dd = datetime.strptime(str(self.reportingdate.rdate), '%Y-%m-%d %H:%M:%S').strftime("%d-%b-%Y")
		return str(dd)
		
	
class LookAheadDetail(db.Model):
	__tablename__ ="lookaheads_details"
	id = db.Column(db.Integer, primary_key=True)
	lookahead_id = db.Column(db.Integer, db.ForeignKey('lookaheads.id'))
	lookahead= db.relationship('LookAhead', backref='detail')
	task_code = db.Column(db.String(80))
	task_name = db.Column(db.String(80))
	start = db.Column(db.DateTime)
	finish = db.Column(db.DateTime)
	#responsible person assignment
	is_active = db.Column(db.Boolean)
	
	def __init__(self, lookahead, code, name, start, finish, is_active=True):
		self.lookahead_id = lookahead.id
		self.task_code= code
		self.task_name = name
		self.start = start
		self.finish = finish
		self.is_active = is_active
		
	def __repr__(self):
		return self.task_name
	