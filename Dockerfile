FROM ubuntu:focal as builder
# set label
LABEL maintainer="NG6"

ENV GO_VER=1.15.14

WORKDIR /downloads
COPY install.sh  /downloads
# download && install go
# gcc for cgo
RUN apt-get update && apt-get install -y --no-install-recommends \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
		wget \
	&& rm -rf /var/lib/apt/lists/*

RUN set -ex \
	&& chmod +x install.sh \
	&& bash install.sh

ENV PATH=$PATH:/usr/local/go/bin
