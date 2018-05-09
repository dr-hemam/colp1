import os, sys, datetime
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from flask.ext.script import Manager, Server
from colp import app, db
from users.models import User
from flask.ext.migrate import MigrateCommand

manager = Manager(app)
manager.add_command('db', MigrateCommand)
manager.add_command("runserver", Server(
	use_debugger = True,
	use_reloader = True,
	host = os.getenv('IP', '0.0.0.0'),
	port = int(os.getenv('PORT', 5000))
	)
)

@manager.command
def create_admin():
    """Creates the admin user."""
    db.session.add(User(
    	firstname='Administrator',
    	lastname='',
        email="admin@conoccult.com",
        username='admin',
        password="admin",
        organisation= None,
        is_admin=True,
        confirmed=True,
        confirmed_on=datetime.datetime.now())
    )
    db.session.commit()



if __name__ == '__main__':
	manager.run()