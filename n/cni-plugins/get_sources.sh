#!/bin/bash
SRC=cni-plugins
VERSION=1.2.0
set -x
wget -c -O ${SRC}-${VERSION}.tar.gz https://github.com/containernetworking/plugins/archive/refs/tags/v${VERSION}.tar.gz || exit 1
tar xzf ${SRC}-${VERSION}.tar.gz && rm -f ${SRC}-${VERSION}.tar.gz
mv plugins-${VERSION} ${SRC}-${VERSION}
chown -R root:root ${SRC}-${VERSION} 2>/dev/null
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
