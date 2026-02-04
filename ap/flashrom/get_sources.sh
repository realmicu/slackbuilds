#!/bin/bash
set -ex
APP=flashrom
URL="https://review.coreboot.org/${APP}"
VERSION="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/v[0-9]* | rev | cut -d/ -f1 | rev | grep -vE -- '-(rc|alpha|beta)' | head -1 | tr -d 'v')"
git clone -b v$VERSION --single-branch $URL $APP-$VERSION
tar cf - $APP-$VERSION | xz -c9 > $APP-$VERSION.tar.xz
[ -s $APP-$VERSION.tar.xz ] && rm -rf $APP-$VERSION
