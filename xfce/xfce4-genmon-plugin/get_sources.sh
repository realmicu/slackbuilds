#!/bin/bash
SRC=xfce4-genmon-plugin
VERSION=4.2.1
set -x
wget -c http://archive.xfce.org/src/panel-plugins/${SRC}/${VERSION%.*}/${SRC}-${VERSION}.tar.bz2
