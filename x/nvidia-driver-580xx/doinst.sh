( cd usr/lib${LIBSUFFIX}/xorg/modules/extensions
  if [ -f libglx.so ] ; then
    if [ -L libglx.so ] ; then rm -f libglx.so
    else mv libglx.so libglx.so-xorg ; fi
    ln -s libglx.so.$VERSION libglx.so
  fi
)
[ -x sbin/ldconfig ] && sbin/ldconfig -X -C etc/ld.so.cache -f etc/ld.so.conf
[ -x usr/bin/update-desktop-database ] && usr/bin/update-desktop-database -q usr/share/applications
