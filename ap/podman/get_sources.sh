#!/bin/bash
SRC=podman
VERSION=3.4.4
set -x
wget -c -O ${SRC}-${VERSION}.tar.gz https://github.com/containers/${SRC}/archive/refs/tags/v${VERSION}.tar.gz
