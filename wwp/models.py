'''


'''
from colp import db
from datetime import datetime


class WWP(db.Model):
	__tablename__ ="wwps"
	id = db.Column(db.Integer, primary_key=True)
	project_id = db.Column(db.Integer, db.ForeignKey('projects.id'))
	project= db.relationship('Project', backref='weeklyworkplan')
	reportingdate_id = db.Column(db.Integer, db.ForeignKey('reportingdates.id'))
	reportingdate= db.relationship('ReportingDate', backref='weeklyworkplan')
	section_id = db.Column(db.Integer, db.ForeignKey('sections.id'))
	section= db.relationship('Section', backref='weeklyworkplan')
	ppc = db.Column(db.Float)
	is_active = db.Column(db.Boolean)
	status = db.Column(db.Boolean)
	__table_args__ = (
        db.UniqueConstraint('project_id', 'reportingdate_id', 'section_id', name='uix_wwp_projid_reportid_section'),
    )
	def __init__(self, project, reportingdate, section, ppc=None, status=False, is_active=True):
		self.is_active = is_active
		self.project_id = project.id
		self.section = section
		self.reportingdate = reportingdate
		self.section_id = section.id
		self.section = section
		self.ppc = ppc
		self.reportingdate_id= reportingdate.id
		self.status =status
	def __repr__(self):
		dd = datetime.strptime(str(self.reportingdate.rdate), '%Y-%m-%d %H:%M:%S').strftime("%d-%b-%Y")
		return str(dd)
		
	
class WWPDetail(db.Model):
	__tablename__ ="wwp_details"
	wwp_id = db.Column(db.Integer, db.ForeignKey('wwps.id'), primary_key=True)
	wwp = db.relationship('WWP', backref='detail')
	task_id = db.Column(db.Integer, db.ForeignKey('lookaheads_details.id'), primary_key=True)
	task = db.relationship('LookAheadDetail', backref='wwptask')
	mon= db.Column(db.Boolean)
	tue = db.Column(db.Boolean)
	wed = db.Column(db.Boolean)
	thu = db.Column(db.Boolean)
	fri = db.Column(db.Boolean)
	sat = db.Column(db.Boolean)
	sun = db.Column(db.Boolean)
	status = db.Column(db.Boolean)
	is_active = db.Column(db.Boolean)
	
	
	def __init__(self, wwp, task, mon, tue, wed, thu, fri, sat, sun, status, is_active=True):
		self.wwp_id = wwp.id
		self.task_id= task.id
		self.task = task
		self.mon = mon
		self.tue = tue
		self.wed = wed
		self.thu = thu
		self.fri = fri
		self.sat = sat
		self.sun = sun
		self.status = status
		self.is_active = is_active
		
	def __repr__(self):
		return str(self.task_id)
	