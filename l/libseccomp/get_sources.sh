#!/bin/bash
SRC=libseccomp
VERSION=2.5.3
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/seccomp/${SRC}/archive/v${VERSION}.tar.gz
