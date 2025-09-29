#!/bin/bash
SRC=conmon
VERSION=2.1.7
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/containers/${SRC}/archive/v${VERSION}.tar.gz
