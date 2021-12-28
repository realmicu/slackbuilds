#!/bin/bash
SRC=virglrenderer
VERSION=0.9.1
set -x
wget -c https://gitlab.freedesktop.org/virgl/$SRC/-/archive/${SRC}-${VERSION}/${SRC}-${SRC}-${VERSION}.tar.bz2 || exit 1
tar xjf ${SRC}-${SRC}-${VERSION}.tar.bz2 && rm -f ${SRC}-${SRC}-${VERSION}.tar.bz2
mv ${SRC}-${SRC}-${VERSION} ${SRC}-${VERSION}
chown -R root:root ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
