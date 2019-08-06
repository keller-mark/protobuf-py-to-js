import os
import json
from flask import Flask, Response, request, send_from_directory
from test_data import get_test_data

root_dir = os.path.dirname(os.path.abspath(__file__))
node_dir = os.path.join(root_dir, 'node_modules')
io_dir = os.path.join(root_dir, 'io')
app = Flask(__name__, static_url_path='')

@app.route('/')
def index():
    return send_from_directory(root_dir, 'index.html')

@app.route('/node_modules/<path:path>')
def send_npm_js(path):
    return send_from_directory(node_dir, path)

@app.route('/io/<path:path>')
def send_io_js(path):
    return send_from_directory(io_dir, path)

@app.route('/data')
def send_data():
    output = get_test_data()
    return app.response_class(
        response=output,
        status=200,
        mimetype='application/protobuf',
    )

if __name__ == '__main__':
    app.run(port=8000, debug=True)