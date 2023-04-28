#!/bin/bash
SRC=buildah
VERSION=1.30.0
set -x
wget -c -O ${SRC}-${VERSION}.tar.gz https://github.com/containers/${SRC}/archive/refs/tags/v${VERSION}.tar.gz
