#!/bin/bash
SRC=fuse-overlayfs
VERSION=1.11
set -x
wget -c -O ${SRC}-${VERSION}.tar.gz https://github.com/containers/${SRC}/archive/refs/tags/v${VERSION}.tar.gz
