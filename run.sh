
PC=/proto/protoc/bin/protoc
SRC_DIR=/proto/io/src
DST_DIR=/proto/io/dst

PROTO_FILE=$1

mkdir -p ${DST_DIR}
${PC} -I=${SRC_DIR} --python_out=${DST_DIR} --js_out=import_style=closure,binary,library=${PROTO_FILE}.lib:${DST_DIR} ${SRC_DIR}/${PROTO_FILE}