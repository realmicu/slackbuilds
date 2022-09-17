#!/bin/bash
SRC=catatonit
VERSION=0.1.7
set -x
wget -c -O ${SRC}-${VERSION}.tar.gz https://github.com/openSUSE/${SRC}/archive/refs/tags/v${VERSION}.tar.gz
