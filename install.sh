#!/bin/bash

export https_proxy=http://172.17.0.1:7890 http_proxy=http://172.17.0.1:7890 all_proxy=socks5://172.17.0.1:7891

# Check CPU architecture
ARCH=$(uname -m)
echo -e "${INFO} Check CPU architecture ..."
if [[ ${ARCH} == "x86_64" ]]; then
    ARCH="amd64"
elif [[ ${ARCH} == "aarch64" ]]; then
    ARCH="arm64"
elif [[ ${ARCH} == "armv7l" ]]; then
    ARCH="armv6l"
else
    echo -e "${ERROR} This architecture is not supported."
    exit 1
fi

# download go
wget -c https://mirrors.ustc.edu.cn/golang/go${GO_VER}.linux-${ARCH}.tar.gz -O - | tar -xz -C /usr/local
# wget -c https://golang.org/dl/go${GO_VER}linux-${ARCH}.tar.gz -O - | tar -xz -C /usr/local
