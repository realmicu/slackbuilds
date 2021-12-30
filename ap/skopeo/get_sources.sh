#!/bin/bash
SRC=skopeo
VERSION=1.5.2
# Build requires a proper git tree:
git clone -b main https://github.com/containers/${SRC}.git $SRC && \
  ( cd $SRC && git co v${VERSION} )
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
