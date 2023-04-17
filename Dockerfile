FROM python:3.9-buster
RUN apt-get update && apt-get install -y curl graphviz \
  && curl -L https://github.com/protocolbuffers/protobuf/releases/download/v21.12/protoc-21.12-linux-x86_64.zip -o protoc-21.12.zip \
  && unzip protoc-21.12.zip -d protoc-21.12 \
  && mv protoc-21.12/bin/* /usr/local/bin/ \
  && mv protoc-21.12/include/* /usr/local/include/ \
  && pip install -U setuptools \
  && pip install "click==7.0.*" "graphviz==0.10.*" "protobuf==3.20.*"
RUN pip install protobuf grpcio-tools
ADD docker/gen_uml.sh /
ADD protobuf_uml_diagram.py /
