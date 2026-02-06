#!/bin/bash
set -ex
SRC=pefile
GITURL="https://github.com/erocarrera/${SRC}"
RELURL="https://github.com/erocarrera/${SRC}/releases/download"
VERSION="$(git ls-remote --tags --refs --sort=-v:refname $GITURL refs/tags/v[0-9]* | head -1 | rev | cut -d/ -f1 | rev | tr -d 'v')"
# We check latest version tag using git but download release archive:
wget -c "${RELURL}/v${VERSION}/${SRC}-${VERSION}.tar.gz"
