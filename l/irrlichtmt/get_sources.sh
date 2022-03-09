#!/bin/bash
SRC=irrlicht
VERSION=1.9.0mt4
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/minetest/${SRC}/archive/refs/tags/${VERSION}.tar.gz
