from colp import app, db
from flask import render_template, redirect, url_for, request, session
from users.models import User
from users.decorators import *

import json

@app.route('/report', methods=['POST', 'GET'])

def report():
    return render_template('reports/dashboard.html')