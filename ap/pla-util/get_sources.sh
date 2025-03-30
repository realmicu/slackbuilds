#!/bin/bash
APP=pla-util
BRANCH=main
URL=https://github.com/serock/pla-util
set -x
git clone -b $BRANCH $URL $APP || exit 1
cd $APP
TAGVER=$(git tag --sort=-creatordate | grep -vE -- '-(rc|alpha|beta)' | head -1)
git checkout $TAGVER
git prune
cd $OLDPWD
VERSION=${TAGVER#v*}
mv ${APP} ${APP}-${VERSION}
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
