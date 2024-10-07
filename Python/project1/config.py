import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'your-secret-key'
    SQLALCHEMY_DATABASE_URI = 'mysql://admin:password@localhost/flask_app_db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
