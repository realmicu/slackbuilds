#!/bin/bash
SRC=stellarium
VERSION=24.4
set -x
wget -c https://github.com/Stellarium/${SRC}/releases/download/v${VERSION}/${SRC}-${VERSION}.tar.gz
