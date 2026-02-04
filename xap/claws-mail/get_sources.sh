#!/bin/bash
set -ex
APP=claws-mail
GITURL="https://git.claws-mail.org/readonly/claws.git"
RELURL="https://www.claws-mail.org/download.php?file=releases"
VERSION="$(git ls-remote --tags --refs --sort=-v:refname $GITURL refs/tags/[0-9]* | head -1 | rev | cut -d/ -f1 | rev)"
# We check latest version tag using git but download release archive:
wget -O ${APP}-${VERSION}.tar.xz "${RELURL}/${APP}-${VERSION}.tar.xz"
