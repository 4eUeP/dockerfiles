FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y curl xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV VERSION 1.1.21
ENV HOME /opt/factorio

WORKDIR /opt/factorio

COPY files/ /tmp/factorio
RUN archive="/tmp/factorio/factorio_headless_x64_$VERSION.tar.xz" && \
    test -f "$archive" || curl -sSL "https://www.factorio.com/get-download/$VERSION/headless/linux64" -o "$archive" && \
    tar -xf "$archive" -C /opt/ && \
    rm -rf /tmp/factorio

ENV PATH /opt/factorio/bin/x64:$PATH

EXPOSE 34197/udp
CMD ["/opt/factorio/bin/x64/factorio", "--help"]
