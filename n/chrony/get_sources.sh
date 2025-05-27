#!/bin/bash
set -ex
APP=chrony
URL=https://gitlab.com/chrony/chrony.git/
VERSION="$(git ls-remote --tags $URL | egrep 'refs/tags/[0-9\.]+$' | tail -1 | rev | cut -d/ -f1 | rev)"
git clone -b $VERSION --single-branch $URL $APP
mv $APP $APP-$VERSION
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
