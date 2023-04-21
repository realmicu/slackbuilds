#!/bin/bash
set -ex
BINDIST=NVIDIA-Linux-x86_64
VERSION=340.108
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/${VERSION}/${BINDIST}-${VERSION}.run
wget https://raw.github.com/envytools/firmware/master/extract_firmware.py
chmod +x ${BINDIST}-${VERSION}.run extract_firmware.py
