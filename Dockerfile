FROM alpine:3.7
RUN apk add git unzip automake libtool curl make build-base autoconf zlib-dev linux-headers cmake

RUN mkdir -p /tmp/protoc && \
    curl -L https://github.com/google/protobuf/releases/download/v3.6.0/protoc-3.6.0-linux-x86_64.zip > /tmp/protoc/protoc.zip && \
    cd /tmp/protoc && \
    unzip protoc.zip && \
    cp /tmp/protoc/bin/protoc /usr/local/bin && \
    cd /tmp && \
    rm -r /tmp/protoc

RUN mkdir -p /tmp/grpc && cd /tmp/grpc && \
    git clone -b v1.30.0 https://github.com/grpc/grpc && cd grpc && \
    git submodule update --init && \
    make grpc_php_plugin

CMD ["protoc"]