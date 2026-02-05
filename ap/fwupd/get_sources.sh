#!/bin/bash
set -ex
APP=fwupd
URL="https://github.com/${APP}/${APP}"
VERSION="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/[0-9]* | rev | cut -d/ -f1 | rev | head -1)"
git clone -b $VERSION --single-branch $URL $APP-$VERSION
tar cf - $APP-$VERSION | xz -c9 > $APP-$VERSION.tar.xz
[ -s $APP-$VERSION.tar.xz ] && rm -rf $APP-$VERSION
