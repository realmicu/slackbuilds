#!/bin/bash
APP=openxcom
SRC=OpenXcom
BRANCH=master
git clone -b $BRANCH --depth 1 https://github.com/${SRC}/${SRC}.git $APP
VERSION=`awk '$1=="#define" && $2=="OPENXCOM_VERSION_LONG" { print $NF }' $APP/src/version.h | sed -e 's/"//g'`_`date '+%Y%m%d'`git
mv ${APP} ${APP}-${VERSION}
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
