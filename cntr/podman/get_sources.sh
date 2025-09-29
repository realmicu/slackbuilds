#!/bin/bash
SRC=podman
VERSION=4.5.0
set -x
wget -c -O ${SRC}-${VERSION}.tar.gz https://github.com/containers/${SRC}/archive/refs/tags/v${VERSION}.tar.gz
