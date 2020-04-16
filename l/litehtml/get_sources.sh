APP=litehtml
VERSION=$(date '+%Y%m%d')git
git clone --depth=1 https://github.com/litehtml/${APP}.git
mv ${APP} ${APP}-${VERSION} 
tar cf - ${APP}-${VERSION} | xz -c9 > ${APP}-${VERSION}.tar.xz
[ -s ${APP}-${VERSION}.tar.xz ] && rm -rf ${APP}-${VERSION}
