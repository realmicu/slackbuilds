#!/bin/bash
set -x
SRC=hyphen
APP=lib${SRC}
git clone https://github.com/hunspell/${SRC}.git
VERSION=$(sed -e 's/[\(\),]/ /g' ${SRC}/configure.ac | awk '$1 == "AM_INIT_AUTOMAKE" && $2 == "hyphen" { print $NF }')
mv ${SRC} ${APP}-${VERSION} 
( cd ${APP}-${VERSION} && rm -rf .git )
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
