#!/bin/bash
SRC=minetest
BRANCH=stable-5
set -x
git clone -b $BRANCH --depth 1 https://github.com/${SRC}/${SRC}.git || exit 1
( cd $SRC && git clone -b $BRANCH --depth 1 https://github.com/${SRC}/minetest_game.git games/minetest_game )
VERSION=$(sed -e 's/(/ /' -e 's/)/ /' ${SRC}/CMakeLists.txt | \
  awk '$1=="set" && $2=="VERSION_MAJOR" { major = $NF; next } \
       $1=="set" && $2=="VERSION_MINOR" { minor = "." $NF; next } \
       $1=="set" && $2=="VERSION_PATCH" { patch = "." $NF ; next } \
       $1=="set" && $2=="VERSION_TWEAK" { tweak = "." $NF; next } \
       END { printf "%s%s%s%s\n", major, minor, patch, tweak }')
mv ${SRC} ${SRC}-${VERSION} 
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
