config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/X11/xorg.conf.d/10-nvidia.conf.new
config etc/ld.so.conf.d/nvidia.conf.new
config etc/modprobe.d/nvidia.conf.new

[ -x sbin/ldconfig ] && sbin/ldconfig -X -C etc/ld.so.cache -f etc/ld.so.conf
[ -x usr/bin/update-desktop-database ] && usr/bin/update-desktop-database -q usr/share/applications
