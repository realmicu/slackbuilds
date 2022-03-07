#!/bin/bash
APP=nmon
SRC=lmon
VERSION=16n
set -x
wget -O ${SRC}${VERSION}.c  https://sourceforge.net/projects/${APP}/files/${SRC}${VERSION}.c/download
