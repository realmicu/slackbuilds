#!/bin/bash
SRC=cjson
VERSION=1.7.15
set -x
wget -O ${SRC}-${VERSION}.tar.gz https://github.com/DaveGamble/cJSON/archive/refs/tags/v${VERSION}.tar.gz
