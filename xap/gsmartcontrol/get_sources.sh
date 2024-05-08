#!/bin/bash
SRC=gsmartcontrol
BRANCH=main
set -x
git clone -b $BRANCH https://github.com/ashaduri/${SRC}.git $SRC || exit 1
cd $SRC
TAGVER=$(git tag --sort=-creatordate | grep -vE -- '-(rc|alpha|beta)' | head -1)
git checkout $TAGVER
git prune
cd $OLDPWD
VERSION=${TAGVER#v*}
mv ${SRC} ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
