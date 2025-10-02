#!/bin/bash
set -ex
APP=Application_name	# change
URL=Repository_URL	# change
VERSION="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/[0-9]* | head -1 | rev | cut -d/ -f1 | rev)"
git clone -b $VERSION --single-branch $URL $APP
mv $APP $APP-$VERSION
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
