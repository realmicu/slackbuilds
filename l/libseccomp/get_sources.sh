#!/bin/bash
SRC=libseccomp
VERSION=2.4.3
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/seccomp/${SRC}/archive/v${VERSION}.tar.gz
