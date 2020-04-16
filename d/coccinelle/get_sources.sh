#!/bin/bash
SRC=coccinelle
VERSION=1.0.8
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/${SRC}/${SRC}/archive/${VERSION}.tar.gz
