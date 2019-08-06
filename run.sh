
PC=/proto/protoc/bin/protoc
SRC_DIR=/proto/io/src
DST_DIR=/proto/io/dst

PROTO_FILE=$1


${PC} -I=${SRC_DIR} --python_out=${DST_DIR} ${SRC_DIR}/${PROTO_FILE}