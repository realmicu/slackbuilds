#!/bin/bash
SRC=crun
VERSION=1.8.4
set -x
wget -O ${SRC}-${VERSION}.tar.xz https://github.com/containers/${SRC}/releases/download/${VERSION}/${SRC}-${VERSION}.tar.xz
