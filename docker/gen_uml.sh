#!/bin/bash
PROTO_PATH="$(pwd)/proto"
PYTHONPATH="$(pwd)/build/out/python"

mkdir -p ${PYTHONPATH}

protoc --proto_path="${PROTO_PATH}" -I=/usr/include --python_out="${PYTHONPATH}" $(find ${PROTO_PATH} -name '*.proto')
FILES="$(find proto -name '*.proto')"

export PYTHONPATH
for p in ${FILES}; do
    p="${p/proto\//}"
    p="${p/\//.}"
    p="${p/.proto/_pb2}"
    python protobuf_uml_diagram.py --proto "${p}" --output="${PYTHONPATH}/.."
done
