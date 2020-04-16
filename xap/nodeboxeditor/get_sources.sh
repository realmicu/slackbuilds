#!/bin/bash
APP=nodeboxeditor
SRC=NodeBoxEditor
BRANCH=master
git clone -b $BRANCH --depth 1 https://github.com/rubenwardy/$SRC $APP
VERSION=`egrep '^set\(NBE_(MAJOR|MINOR|PATCH)_VERSION [0-9]+\)$' ${APP}/CMakeLists.txt | sed -e 's/_/ /g' -e 's/)//' | awk '$2=="MAJOR" { v_maj = $NF; next } $2=="MINOR" { v_min = $NF; next } $2=="PATCH" { v_plv = $NF; next } END { printf "%d.%d.%d\n", v_maj, v_min, v_plv }'`
mv ${APP} ${APP}-${VERSION} 
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
