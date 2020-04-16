#!/bin/bash
VERSION=1.5.2
LIBBURN_VERSION=${VERSION}.pl01
LIBISOBURN_VERSION=$VERSION
LIBISOFS_VERSION=$VERSION
set -x
wget -c http://files.libburnia-project.org/releases/libburn-${LIBBURN_VERSION}.tar.gz \
	http://files.libburnia-project.org/releases/libisoburn-${LIBISOBURN_VERSION}.tar.gz \
	http://files.libburnia-project.org/releases/libisofs-${LIBISOFS_VERSION}.tar.gz
