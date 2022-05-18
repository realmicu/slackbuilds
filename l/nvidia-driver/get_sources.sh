#!/bin/bash
set -x
BINDIST=NVIDIA-Linux-x86_64
VERSION=390.151
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/${VERSION}/${BINDIST}-${VERSION}.run && \
  chmod +x ${BINDIST}-${VERSION}.run
