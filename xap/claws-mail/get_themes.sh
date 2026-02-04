#!/bin/bash
set -ex
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
