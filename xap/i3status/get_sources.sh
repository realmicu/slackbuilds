#!/bin/bash
SRC=i3status
VERSION=2.13
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/i3/${SRC}/archive/${VERSION}.tar.gz
