import os

SECRET_KEY= 'never-guess'
DEBUG = True
DB_USER_NAME ='root'
DB_PASSWORD ='hassan'
DB_NAME = 'colp'
DB_HOST = os.getenv('IP', '0.0.0.0')
DB_URI ="mysql+pymysql://%s:%s@%s/%s" %(DB_USER_NAME, DB_PASSWORD, DB_HOST, DB_NAME)
SQLALCHEMY_DATABASE_URI = DB_URI
SQLALCHEMY_TRACK_MODIFICATIONS = True
