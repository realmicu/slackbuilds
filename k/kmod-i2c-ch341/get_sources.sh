#!/bin/bash
set -x
SRC=i2c-ch341
APP=kmod-${SRC}
VERSION=`date '+%Y%m%d'`git
git clone https://github.com/gmarco/${SRC}.git
mv ${SRC} ${APP}-${VERSION} 
( cd ${APP}-${VERSION} && rm -rf .git )
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
