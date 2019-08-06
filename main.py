import os
import json
from flask import Flask, Response, request, send_from_directory

root_dir = os.path.dirname(os.path.abspath(__file__))
node_dir = os.path.join(root_dir, 'node_modules')
app = Flask(__name__, static_url_path='')

@app.route('/')
def index():
    return send_from_directory(root_dir, 'index.html')

@app.route('/js/<path:path>')
def send_js(path):
    return send_from_directory(node_dir, path)

@app.route('/data')
def send_data():
    output = { "test": 10 }
    return app.response_class(
        response=json.dumps(output),
        status=200,
        mimetype='application/json',
    )

if __name__ == '__main__':
    app.run(port=8000, debug=True)