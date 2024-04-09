FROM golang:1.20-alpine AS gaiad-builder
WORKDIR /src/app/
ENV PACKAGES curl make git libc-dev bash gcc linux-headers eudev-dev python3 git
RUN apk add --no-cache $PACKAGES
RUN git clone -b v14.2.0 https://github.com/cosmos/gaia && \
    cd gaia/ && \
    ls -lah && \
    CGO_ENABLED=0 make install

FROM ubuntu:latest
COPY --from=gaiad-builder /go/bin/gaiad /usr/local/bin/
EXPOSE 26656 26657 1317 9090
USER 0
COPY start.sh /root/start.sh
RUN apt-get update && \
    apt-get install bash curl wget jq nano -y

ENTRYPOINT bash /root/start.sh