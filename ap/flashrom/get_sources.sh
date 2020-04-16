#!/bin/bash
SRC=flashrom
VERSION=1.1
set -x
wget -c https://download.flashrom.org/releases/${SRC}-v${VERSION}.tar.bz2 && \
  tar xjf ${SRC}-v${VERSION}.tar.bz2 && \
  mv ${SRC}-v${VERSION} ${SRC}-${VERSION} && \
  tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz && \
  rm -rf ${SRC}-v${VERSION}.tar.bz2 ${SRC}-${VERSION}
