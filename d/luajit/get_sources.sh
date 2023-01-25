#!/bin/bash
set -x
SRC=luajit
git clone https://luajit.org/git/${SRC}.git
VERSION=$(cd $SRC && git log -n 1 --format='%cs_%h' --abbrev=8 | sed -e 's/-//g')
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
