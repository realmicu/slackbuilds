#!/bin/bash
APP=ch341prog
VERSION=`date '+%Y%m%d'`git
git clone https://github.com/setarcos/${APP}
mv ${APP} ${APP}-${VERSION} 
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
