#!/bin/bash
SRC=ocaml
VERSION=4.10.0
set -x
wget -O ${SRC}-${VERSION}.tar.gz -c https://github.com/${SRC}/${SRC}/archive/${VERSION}.tar.gz
