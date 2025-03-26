#!/bin/bash
APP=iperf3
BRANCH=master
URL=https://github.com/esnet/iperf
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
