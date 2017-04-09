from colp import db



class User(db.Model):
    __tablename__='users'
    id = db.Column(db.Integer, primary_key =True)
    firstname = db.Column(db.String(80))
    lastname = db.Column(db.String(80))
    email = db.Column(db.String(35), unique =True)
    username = db.Column(db.String(80), unique= True)
    password = db.Column(db.String(80))
    organisation_id = db.Column(db.Integer, db.ForeignKey('organisations.id'))
    organisation= db.relationship('Organisation', backref='users')
	
    is_admin = db.Column(db.Boolean)

    def __init__(self, firstname, lastname, email, username, password, organisation, is_admin=False):
        self.firstname = firstname
        self.email = email
        self.lastname = lastname
        self.password = password
        self.is_admin = is_admin
        self.username = username
        self.organisation_id = organisation.id
        

    def __repr__(self):
        return self.username

       
class Role(db.Model):
    __tablename__='roles'
    __table_args__ = {'extend_existing': True}
    id = db.Column(db.Integer, primary_key =True)
    name = db.Column(db.String(80))
    organisation_id = db.Column(db.Integer, db.ForeignKey('organisations.id'))
    organisation = db.relationship('Organisation', backref='roles')
    manager_id = db.Column(db.Integer, db.ForeignKey('roles.id'))
    manager = db.relationship(lambda: Role, remote_side=id,backref='subs')
    is_active = db.Column(db.Boolean)
    def __init__(self, name, organisation, manager, is_active=True):
        self.name = name
        if organisation is not None:
            self.organisation_id = organisation.id
        if manager is not None:
            self.manager_id = manager.id
        self.is_active = is_active
        
    def __repr__(self):
        return self.name