# docker build . -f ccls -t laxcat/ccls
FROM ubuntu:focal

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
      clang cmake libclang-dev llvm-dev rapidjson-dev \
      git && \
    rm -rf /var/lib/apt/lists/*

ARG PARALLEL
ARG RELEASE=0.20210330

RUN BUILD_DIR=/tmp/ccls && \
    mkdir -p $BUILD_DIR && cd $BUILD_DIR && \
    git init && git remote add origin https://github.com/MaskRay/ccls.git && \
    git fetch --depth 1 origin $RELEASE && \
    git checkout FETCH_HEAD && \
    cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release && \
    cd Release && make -j ${PARALLEL:-$(nproc)} && \
    make install -j${PARALLEL:-$(nproc)} && \
    rm -rf $BUILD_DIR

CMD /usr/local/bin/ccls

# vim: set ft=dockerfile:
