#!/bin/bash
SRC=zbar
BRANCH=master
git clone -b $BRANCH --depth 1 https://github.com/mchehab/${SRC}.git $SRC
VERSION=`sed -e 's/\[/ /g' -e 's/\]/ /g' -e 's/,/ /g' -e 's/(/ /g' $SRC/configure.ac | awk -v DATE=\`date '+%Y%m%d'\` '$1=="AC_INIT" && $2=="zbar" { printf "%s_%sgit\n", $(NF-2), DATE }'`
chown -R root:root $SRC
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
