#!/bin/bash

RELEASE="v1.41.1"

cd external/grpc && \
    git fetch --depth 1 origin $RELEASE && \
    git checkout FETCH_HEAD && \
    git submodule update --init --recursive --depth 1

docker build . -t laxcat/grpc:${RELEASE}
