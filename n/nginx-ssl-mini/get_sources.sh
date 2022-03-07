#!/bin/bash
SRC=nginx
VERSION=1.21.6
set -x
wget -c https://nginx.org/download/${SRC}-${VERSION}.tar.gz
