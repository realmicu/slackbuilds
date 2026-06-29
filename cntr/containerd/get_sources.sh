#!/bin/bash
set -ex
APP="containerd"
URL="https://github.com/containerd/$APP"
TAGVER="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/v[0-9]*| rev | cut -d/ -f1 | rev | grep -vE -- '-(rc|alpha|beta)' | head -1)"
VERSION="$(tr -d 'v' <<< $TAGVER)"
git clone -b $TAGVER --single-branch --recurse-submodules $URL $APP-$VERSION
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
