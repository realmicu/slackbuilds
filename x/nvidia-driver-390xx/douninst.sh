( cd usr/lib${LIBSUFFIX}
  [ -f libGLX_indirect.so.0 ] && rm -f libGLX_indirect.so.0
  [ -f libGLX_mesa.so.0.0.0 ] && ln -s libGLX_mesa.so.0.0.0 libGLX_indirect.so.0
)
( cd usr/lib${LIBSUFFIX}/xorg/modules/extensions
  [ -f libglx.so ] && rm -f libglx.so
  [ -f libglx.so-xorg ] && mv libglx.so-xorg libglx.so
)
