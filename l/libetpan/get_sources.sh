#!/bin/bash
SRC=libetpan
BRANCH=master
git clone -b $BRANCH --depth 1 https://github.com/dinhviethoa/${SRC}.git $SRC
VERSION=$(sed -e 's/\[/ /g' -e 's/\]/ /g' -e 's/(/ /g' $SRC/configure.ac | awk -v DATE=$(date '+%Y%m%d') '$1=="m4_define" && $2=="maj_version" { major=$(NF-1); next } $1=="m4_define" && $2=="min_version" { minor=$(NF-1); next } $1=="m4_define" && $2=="mic_version" { micro=$(NF-1); next } END { printf "%d.%d.%d_%sgit\n", major, minor, micro, DATE }')
chown -R root:root $SRC
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
