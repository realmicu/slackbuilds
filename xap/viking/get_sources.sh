#!/bin/bash
SRC=viking
VERSION=1.8
set -x
wget -c https://github.com/viking-gps/${SRC}/archive/${SRC}-${VERSION}.tar.gz || exit 1
tar xf ${SRC}-${VERSION}.tar.gz && rm -f ${SRC}-${VERSION}.tar.gz
mv ${SRC}-${SRC}-${VERSION} ${SRC}-${VERSION} 
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
