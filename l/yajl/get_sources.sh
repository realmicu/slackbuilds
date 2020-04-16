#!/bin/bash
SRC=yajl
VERSION=2.1.0
set -x
wget -O - http://github.com/lloyd/${SRC}/tarball/${VERSION} | tar xzf -
mv lloyd-${SRC}-* ${SRC}-${VERSION} || exit 1
chown -R root:root ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
