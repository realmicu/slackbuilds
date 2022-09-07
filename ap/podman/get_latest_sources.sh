#!/bin/bash
SRC=podman
# Build requires a proper git tree:
git clone -b main https://github.com/containers/${SRC}.git $SRC
VERSION=$(awk '$1=="var" && $2=="Version" { print $NF }' $SRC/version/version.go | cut -d\" -f2 | sed -e 's/-/_/' -e 's/"//g')_$(cd $SRC && git log -n 1 --format=%h --abbrev=8)
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
