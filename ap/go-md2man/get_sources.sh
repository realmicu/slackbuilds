#!/bin/bash
SRC=go-md2man
VERSION=2.0.1
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/cpuguy83/${SRC}/archive/v${VERSION}.tar.gz
