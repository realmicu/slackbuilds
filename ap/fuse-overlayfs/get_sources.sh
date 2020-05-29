#!/bin/bash
SRC=fuse-overlayfs
git clone -b master https://github.com/containers/${SRC}.git $SRC
VERSION=$(cd $SRC && git describe --tags --dirty | sed -e 's/v//' -e 's/-/_/g')
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
