#!/bin/bash
SRC=go-md2man
VERSION=1.0.10
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/cpuguy83/${SRC}/archive/v${VERSION}.tar.gz
