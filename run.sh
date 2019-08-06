
PC=/proto/protoc/bin/protoc
PCJS=/proto/js/node_modules/protobufjs/bin/pbjs
SRC_DIR=/proto/io/src
DST_DIR=/proto/io/dst

PROTO_FILE=$1

mkdir -p ${DST_DIR}
${PC} -I=${SRC_DIR} --python_out=${DST_DIR} ${SRC_DIR}/${PROTO_FILE}
${PCJS} -t json ${SRC_DIR}/${PROTO_FILE} > ${DST_DIR}/${PROTO_FILE}.json