#!/bin/bash
set -ex
APP="slirp4netns"
URL="https://github.com/rootless-containers/$APP"
TAGVER="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/{,v}[0-9]* | rev | cut -d/ -f1 | rev | head -1)"
VERSION="$(tr -d 'v' <<< $TAGVER)"
git clone -b $TAGVER --single-branch --recurse-submodules $URL $APP-$VERSION
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
