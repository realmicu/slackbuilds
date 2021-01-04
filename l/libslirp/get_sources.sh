#!/bin/bash
SRC=libslirp
VERSION=4.4.0
set -x
wget -O ${SRC}-${VERSION}.tar.bz2 https://gitlab.freedesktop.org/slirp/${SRC}/-/archive/v${VERSION}/${SRC}-v${VERSION}.tar.bz2
