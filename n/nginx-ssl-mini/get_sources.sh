#!/bin/bash
SRC=nginx
VERSION=1.19.0
set -x
wget -c https://nginx.org/download/${SRC}-${VERSION}.tar.gz
