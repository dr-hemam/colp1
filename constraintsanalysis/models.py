'''


'''
from colp import db
from datetime import datetime


class ConstraintAnalysis(db.Model):
	__tablename__ ="constraintanalysis"
	id = db.Column(db.Integer, primary_key=True)
	project_id = db.Column(db.Integer, db.ForeignKey('projects.id'))
	project= db.relationship('Project', backref='constraintsanalysis')
	reportingdate_id = db.Column(db.Integer, db.ForeignKey('reportingdates.id'))
	reportingdate= db.relationship('ReportingDate', backref='constraintsanalysis')
	is_active = db.Column(db.Boolean)
	status = db.Column(db.Boolean)

	def __init__(self, project, reportingdate, is_active=True):
		self.is_active = is_active
		self.project_id = project.id
		self.reportingdate = reportingdate
		self.reportingdate_id= reportingdate.id
		
	def __repr__(self):
		dd = datetime.strptime(str(self.reportingdate.rdate), '%Y-%m-%d %H:%M:%S').strftime("%d-%b-%Y")
		return str(dd)
		
	
class ConstraintAnalysisDetail(db.Model):
	__tablename__ ="constraintanalysis_details"
	constraintanalysis_id = db.Column(db.Integer, db.ForeignKey('constraintanalysis.id'), primary_key=True)
	constraintanalysis = db.relationship('ConstraintAnalysis', backref='detail')
	task_id = db.Column(db.Integer, db.ForeignKey('lookaheads_details.id'), primary_key=True)
	task = db.relationship('LookAheadDetail', backref='detail')
	constraint_id = db.Column(db.Integer, db.ForeignKey('constraints.id'), primary_key=True)
	constraint = db.relationship('Constraint', backref='detail')
	status = db.Column(db.Boolean)
	is_active = db.Column(db.Boolean)
	
	def __init__(self, constraintanalysis, task, constraint, status, is_active=True):
		self.constraintanalysis_id = constraintanalysis.id
		self.task_id= task.id
		self.constraint_id = constraint.id
		self.status = status
		self.is_active = is_active
		
	def __repr__(self):
		return self.task_name
	