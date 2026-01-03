#!/bin/bash
APP=viking
VERSION=1.10
set -ex
wget -c -O ${APP}-${VERSION}.tar.bz2 https://sourceforge.net/projects/${APP}/files/${APP}-${VERSION}.tar.bz2/download
