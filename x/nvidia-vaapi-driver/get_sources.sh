#!/bin/bash
set -ex
APP="nvidia-vaapi-driver"
URL="https://github.com/elFarto/${APP}"
VERSION="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/v[0-9]* | rev | cut -d/ -f1 | rev | head -1 | cut -dv -f2)"
git clone -b v$VERSION --single-branch $URL $APP-$VERSION
tar cf - $APP-$VERSION | xz -c9 > $APP-$VERSION.tar.xz
[ -s $APP-$VERSION.tar.xz ] && rm -rf $APP-$VERSION
