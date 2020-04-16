#!/bin/bash
git clone -b master --depth 1 https://gitlab.com/BenjaminDobell/Heimdall.git
VERSION=`awk '$1=="const" && $2=="char" && $3=="*version" { print $NF }' Heimdall/heimdall/source/Interface.cpp | sed -e 's/^"v//' -e 's/";$//'`
mv Heimdall heimdall-$VERSION
tar cf - heimdall-$VERSION | xz -c9 > heimdall-$VERSION.tar.xz
[ -s heimdall-$VERSION.tar.xz ] && rm -rf heimdall-$VERSION
