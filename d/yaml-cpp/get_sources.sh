#!/bin/bash
SRC=yaml-cpp
VERSION=0.6.3
set -x
wget -O - https://github.com/jbeder/${SRC}/archive/${SRC}-${VERSION}.tar.gz | tar xzf -
# fix directory name:
mv ${SRC}-${SRC}-${VERSION} ${SRC}-${VERSION}
chown -R root:root ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
rm -rf ${SRC}-${VERSION}
