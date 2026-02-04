#!/bin/bash
set -ex
APP=viking
GITURL="https://github.com/viking-gps/viking"
RELURL="https://sourceforge.net/projects/${APP}/files"
VERSION="$(git ls-remote --tags --refs --sort=-v:refname $GITURL refs/tags/viking-[0-9]* | head -1 | rev | cut -d- -f1 | rev)"
# We check latest version tag using git but download release archive:
wget -c -O ${APP}-${VERSION}.tar.bz2 "${RELURL}/${APP}-${VERSION}.tar.bz2/download"
