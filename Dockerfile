FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget unzip build-essential

RUN mkdir -p /proto
WORKDIR /proto
RUN wget -O ./protoc-3.9.0-linux-x86_64.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.9.0/protoc-3.9.0-linux-x86_64.zip
RUN unzip ./protoc-3.9.0-linux-x86_64.zip -d protoc

RUN mkdir -p /proto/io/src
RUN mkdir -p /proto/io/dst

COPY ./run.sh ./run.sh
ENTRYPOINT ["bash", "/proto/run.sh"]