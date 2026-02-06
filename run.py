'''### info:
    "Arranca" la aplicación. 
    "Arranca" el servidor http

    Dependencias:
      pip install Flask
      pip install Werkzeug
      pip install mysql-connector-python

    Referencias:
      https://pypi.org/project/Flask/
      https://flask.palletsprojects.com/en/2.3.x/
      https://pythonbasics.org/flask-http-methods/
      https://pypi.org/project/Werkzeug/
'''
import os
from flask import Flask, session
from route import route
 
def main():
    app = Flask(__name__,template_folder='templates',static_folder='static')
    
    # C O N F I G
    # Para poder iniciar session, colocar un string aleatorio para inicializar la clave.
    app.config['SECRET_KEY'] = 'some random string'  


    route(app)
    app.run('0.0.0.0', 1908, debug=True) 
main()