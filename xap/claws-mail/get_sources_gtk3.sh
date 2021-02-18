#!/bin/bash
SRC=claws-mail
BRANCH=gtk3
set -x
git clone -b $BRANCH git://git.claws-mail.org/claws.git $SRC
VERSION=$(cd $SRC && git describe --abbrev=6 --dirty --always | sed -e 's/-/_/g')
mv $SRC ${SRC}-${VERSION}
tar cf - ${SRC}-${VERSION} | xz -c9 > ${SRC}-${VERSION}.tar.xz
[ -s ${SRC}-${VERSION}.tar.xz ] && rm -rf ${SRC}-${VERSION}
rm -rf themes && mkdir themes || exit 1
for i in A_Ducks_Claw \
  Blaue_Klaue \
  Coons_Blue \
  Fugue \
  Gnome \
  Tango_1.2.1 \
  clawsola-0.3 \
  elementary \
  gnome-brave; do
  wget -O themes/claws-mail-theme_${i}.tar.gz "https://www.claws-mail.org/download.php?file=themes/png/claws-mail-theme_${i}.tar.gz"
done
