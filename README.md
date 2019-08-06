## protobuf python-to-js demo

Serializing data in python and deserializing in the browser using [protobuf](https://developers.google.com/protocol-buffers/).

### How it works
- Docker container compiles `.proto` definitions to both Python output and JSON output
- Flask server serializes data according to the Python class compiled from the `.proto` file
- Flask server serves `index.html` page that does the following:
    - load [protobufjs](https://www.npmjs.com/package/protobufjs)
    - load the JSON object compiled from the `.proto` file
    - fetch serialized data from Flask at `/data` endpoint
    - deserialize and display on the page

### Run the demo
```sh
# Compile the message format located at io/src/addressbook.proto
docker build -t protoc .
docker run -v $(pwd)/io:/proto/io protoc addressbook.proto
# Install js dependencies
npm install
# Install python dependencies
conda env create -f environment.yml
conda activate protobuf-demo-env
# Start python server
python main.py
```

Open http://localhost:8000.