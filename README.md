## protobuf python-to-js demo

Serializing data in python and deserializing in the browser using [protobuf](https://developers.google.com/protocol-buffers/).

```sh
mkdir -p dst
docker build -t protoc .
docker run -v $(pwd)/io:/proto/io protoc addressbook.proto
npm install
conda env create -f environment.yml
conda activate protobuf-demo-env
npm run start
```

Open http://localhost:8000