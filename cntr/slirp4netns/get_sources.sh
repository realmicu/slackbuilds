#!/bin/bash
SRC=slirp4netns
VERSION=1.2.0
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/rootless-containers/${SRC}/archive/v${VERSION}.tar.gz
