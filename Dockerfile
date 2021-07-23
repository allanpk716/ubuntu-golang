FROM ubuntu:focal as builder
# set label
LABEL maintainer="NG6"

ENV GO_VER=1.15.14

WORKDIR /downloads
COPY install.sh  /downloads
# download && install go
RUN apt -y update && apt -y install wget \
    &&  apt-get clean \
    &&  rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*
        
RUN set -ex \
	&& chmod +x install.sh \
	&& bash install.sh

ENV PATH=$PATH:/usr/local/go/bin
