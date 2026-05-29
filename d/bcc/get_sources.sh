#!/bin/bash
set -ex
APP="bcc"
URL="https://github.com/iovisor/${APP}"
git clone -b master --single-branch --recurse-submodules $URL $APP
VERSION="$(cd $APP && git log -n 1 --format='%cs_%h_git' --abbrev=8 | sed -e 's/-//g')"
[ -z "$VERSION" ] && echo "Cannot find version info" && exit 1
mv $APP $APP-$VERSION
tar cf - $APP-$VERSION | xz -c9 > $APP-$VERSION.tar.xz
[ -s $APP-$VERSION.tar.xz ] && rm -rf $APP-$VERSION
