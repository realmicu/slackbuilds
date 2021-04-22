#!/bin/bash
SRC=xfce4-notes-plugin
git clone -b master https://gitlab.xfce.org/panel-plugins/${SRC}.git $SRC
VERSION=$(cd $SRC && git describe --tags --dirty | rev | cut -d- -f1-3 | rev | sed -e 's/v//' -e 's/-/_/g')
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
