#!/bin/bash
VERSION=6.3
set -x
wget -c http://download.savannah.gnu.org/releases/avrdude/avrdude-${VERSION}.tar.gz \
	http://download.savannah.gnu.org/releases/avrdude/avrdude-doc-${VERSION}.tar.gz
