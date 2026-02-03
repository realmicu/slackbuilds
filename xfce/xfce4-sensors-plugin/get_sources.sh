#!/bin/bash
set -ex
APP=xfce4-sensors-plugin
URL=https://gitlab.xfce.org/panel-plugins/${APP}.git
# Tags are named 'xfce4-sensors-plugin-VERSION':
APPVER="$(git ls-remote --tags --refs --sort=-v:refname $URL refs/tags/xfce4-sensors-plugin-[0-9]* | head -1 | rev | cut -d/ -f1 | rev)"
git clone -b ${APPVER} --single-branch $URL ${APPVER}
tar cf - ${APPVER} | xz -c9 > ${APPVER}.tar.xz
[ -s ${APPVER}.tar.xz ] && rm -rf ${APPVER}
