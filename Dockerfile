FROM thethingsindustries/protoc:3.1.27 as protoc

RUN apk add git automake libtool curl make build-base autoconf zlib-dev linux-headers cmake

RUN mkdir -p /tmp/grpc && cd /tmp/grpc && \
    git clone -b v1.30.0 https://github.com/grpc/grpc && cd grpc && \
    git submodule update --init && \
    make grpc_php_plugin