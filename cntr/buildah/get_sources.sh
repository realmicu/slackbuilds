#!/bin/bash
SRC=buildah
# Match podman - 'podman system info | fgrep -w buildahVersion':
VERSION="1.33.8"
set -x
wget -c -O ${SRC}-${VERSION}.tar.gz https://github.com/containers/${SRC}/archive/refs/tags/v${VERSION}.tar.gz
