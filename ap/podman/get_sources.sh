#!/bin/bash
SRC=libpod
VERSION=2.2.1
git clone -b master https://github.com/containers/${SRC}.git $SRC && \
  ( cd $SRC && git co v${VERSION} )
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
