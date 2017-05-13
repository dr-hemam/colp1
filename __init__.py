from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
from flask.ext.migrate import Migrate
from sqlalchemy import exc


app = Flask(__name__)
app.config.from_object('settings')
db = SQLAlchemy(app)

#Migration
migrate= Migrate(app, db)
#from app import views
from users import views
from project import views
from organisations import views
from calendars import views
from sections import views
from delayreasons import views
from constraints import views
from permissions import views
from calendars import views
from lookaheads import views
from constraintsanalysis import views
from wwp import views
from reporting import views