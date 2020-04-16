#!/bin/bash
SRC=x264
git clone -b master https://code.videolan.org/videolan/${SRC}.git ${SRC}
VERSION=$(cd ${SRC} && ./version.sh | sed -e 's/"//g' | awk '$2=="X264_POINTVER" { print $3 }')_$(date '+%Y%m%d')git
mv ${SRC} ${SRC}-${VERSION} 
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
