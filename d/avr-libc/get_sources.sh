#!/bin/bash
VERSION=2.0.0
set -x
wget -c http://download.savannah.gnu.org/releases/avr-libc/avr-libc-${VERSION}.tar.bz2 \
	http://download.savannah.gnu.org/releases/avr-libc/avr-libc-manpages-${VERSION}.tar.bz2
