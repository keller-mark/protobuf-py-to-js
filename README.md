## protobuf python-to-js demo

Serializing data in python and deserializing in the browser using [protobuf](https://developers.google.com/protocol-buffers/).

```sh
# Compile the message format located in io/src/
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

Open http://localhost:8000