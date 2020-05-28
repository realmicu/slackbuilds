#!/bin/bash
SRC=crun
git clone -b master https://github.com/containers/${SRC}.git $SRC
VERSION=$(cd $SRC && ./build-aux/git-version-gen --prefix "" /dev/null | sed -e 's/-/_/g')
mv $SRC ${SRC}-${VERSION} 
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
