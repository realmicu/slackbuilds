#!/bin/bash
set -ex
APP="qemu"
URL="https://gitlab.com/qemu-project/${APP}.git"
MATCHVER="v11.*"
TAGVER="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/${MATCHVER} | rev | cut -d/ -f1 | rev | grep -vE -- '(rc|alpha|beta)' | head -1)"
VERSION="$(tr -d 'v' <<< $TAGVER)"
wget -c https://download.qemu.org/${APP}-${VERSION}.tar.xz
