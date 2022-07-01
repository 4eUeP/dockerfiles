# docker build . -t laxcat/grpc:${RELEASE}
#
# ref: https://github.com/grpc/grpc/blob/master/BUILDING.md

# ------------------------------------------------------------------------------

FROM debian:sid as builder

RUN apt-get update && apt-get install -y \
      build-essential autoconf libtool libssl-dev pkg-config cmake git

ARG PARALLEL

COPY ./external/grpc /build/grpc
RUN RELEASE_DIR=/release && mkdir -p $RELEASE_DIR && \
    cd /build/grpc && \
    cmake -DCMAKE_INSTALL_PREFIX=$RELEASE_DIR \
          -DgRPC_BUILD_TESTS=OFF \
          -DBUILD_SHARED_LIBS=ON \
          -DgRPC_INSTALL=ON \
          -DCMAKE_BUILD_TYPE=Release \
          -DgRPC_SSL_PROVIDER=package \
          . && \
    make -j ${PARALLEL:-$(nproc)} && \
    make install -j${PARALLEL:-$(nproc)}

# ------------------------------------------------------------------------------

FROM debian:sid

COPY --from=builder /release/ /usr/local/

ENV PATH="$PATH:/usr/local/bin"
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

CMD /bin/bash

# vim: set ft=dockerfile:
