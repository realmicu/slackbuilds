#!/bin/bash
SRC=$(ls ../../xap/minetest/minetest-[0-9]*.tar.?z* 2>/dev/null | tail -1)
[ ! -z "$SRC" ] && [ -s "$SRC" ] && ln -s $SRC .
