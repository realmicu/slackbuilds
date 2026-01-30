( cd usr/lib${LIBDIRSUFFIX}
  [ -f libGLX_indirect.so.0 ] && rm -f libGLX_indirect.so.0
  [ -f libGLX_mesa.so.0.0.0 ] && ln -s libGLX_mesa.so.0.0.0 libGLX_indirect.so.0
)
