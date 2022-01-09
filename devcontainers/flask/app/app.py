from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
  return "Hello Flask Test on Docker"

@app.route('/foo')
def foo():
  return "Endpoint is Foo"
