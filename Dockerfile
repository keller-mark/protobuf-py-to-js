FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get update && apt-get install -y wget unzip build-essential nodejs

RUN mkdir -p /proto
WORKDIR /proto
# Install protobuf compiler
RUN wget -O ./protoc-3.9.0-linux-x86_64.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.9.0/protoc-3.9.0-linux-x86_64.zip
RUN unzip ./protoc-3.9.0-linux-x86_64.zip -d protoc

# Install protobufjs
RUN mkdir -p /proto/js
COPY ./package.json /proto/js/package.json
COPY ./package-lock.json /proto/js/package-lock.json
RUN cd /proto/js && npm install && cd -

RUN mkdir -p /proto/io/src
RUN mkdir -p /proto/io/dst

COPY ./run.sh ./run.sh

ENTRYPOINT ["bash", "/proto/run.sh"]