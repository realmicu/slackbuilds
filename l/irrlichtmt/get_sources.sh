#!/bin/bash
SRC=irrlicht
BRANCH=master
set -x
git clone -b $BRANCH https://github.com/minetest/${SRC}.git || exit 1
cd $SRC
VERSION=$(git tag --sort=-creatordate | head -1)
git checkout $VERSION
cd $OLDPWD
mv ${SRC} ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
