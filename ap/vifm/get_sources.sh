#!/bin/bash
SRC=vifm
VERSION=0.10.1
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/${SRC}/${SRC}/archive/v${VERSION}.tar.gz
