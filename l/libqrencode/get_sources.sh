#!/bin/bash
SRC=libqrencode
BRANCH=master
git clone -b $BRANCH --depth 1 https://github.com/fukuchi/${SRC}.git $SRC
VERSION=$(sed -e 's/\[/ /g' -e 's/\]/ /g' -e 's/(/ /g' $SRC/configure.ac | awk -v DATE=$(date '+%Y%m%d') '$1=="m4_define" && $2=="__MAJOR_VERSION" { major=$(NF-1); next } $1=="m4_define" && $2=="__MINOR_VERSION" { minor=$(NF-1); next } $1=="m4_define" && $2=="__MICRO_VERSION" { micro=$(NF-1); next } END { printf "%d.%d.%d_%sgit\n", major, minor, micro, DATE }')
chown -R root:root $SRC
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
