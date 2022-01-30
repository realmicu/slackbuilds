#!/bin/bash
set -x
SRC=i2c-ch341
APP=kmod-${SRC}
git clone https://github.com/gmarco/${SRC}.git
VERSION=$(cd $SRC && git log -n 1 --format='%cs_%h' --abbrev=8 | sed -e 's/-//g')
mv $SRC ${APP}-${VERSION}
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
