#!/bin/bash
set -x
APP=i2c-ch341
git clone https://github.com/gmarco/${APP}
VERSION=$(cd $APP && git log -n 1 --format='%cs_%h' --abbrev=8 | sed -e 's/-//g')
mv $APP ${APP}-${VERSION}
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
