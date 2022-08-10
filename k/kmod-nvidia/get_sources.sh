#!/bin/bash
BINDIST=NVIDIA-Linux-x86_64
SRC=$(ls ../../x/nvidia-driver/${BINDIST}-*.run 2>/dev/null | tail -1)
[ ! -z "$SRC" ] && [ -s "$SRC" ] && ln -s $SRC .
