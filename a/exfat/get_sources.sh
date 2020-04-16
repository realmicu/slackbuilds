git clone https://github.com/relan/exfat.git
( cd exfat && autoreconf --install )
VERSION=`egrep "^[[:space:]]*VERSION[[:space:]]*='[0-9\.]+'$" exfat/configure | cut -d= -f2 | sed -e "s:'::g"`
mv exfat exfat-$VERSION
tar cf - exfat-$VERSION | xz -c9 > exfat-$VERSION.tar.xz
[ -s exfat-$VERSION.tar.xz ] && rm -rf exfat-$VERSION
