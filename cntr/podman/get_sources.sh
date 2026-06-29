#!/bin/bash
set -ex
APP="podman"
URL="https://github.com/podman-container-tools/$APP"
# We lock on stable v4.9.x for now as it is the last one that uses CNI and slirp4netns:
MATCHVER="v4.9.*"
TAGVER="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/${MATCHVER} | rev | cut -d/ -f1 | rev | fgrep -v -- "-rc" | head -1)"
VERSION="$(tr -d 'v' <<< $TAGVER)"
wget -O - https://github.com/podman-container-tools/${APP}/archive/refs/tags/${TAGVER}.tar.gz | \
  gzip -cd | xz -c9 > ${APP}-${VERSION}.tar.xz
