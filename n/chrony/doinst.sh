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

preserve_perms() {
  NEW="$1"
  OLD="$(dirname ${NEW})/$(basename ${NEW} .new)"
  if [ -e ${OLD} ]; then
    cp -a ${OLD} ${NEW}.incoming
    cat ${NEW} > ${NEW}.incoming
    mv ${NEW}.incoming ${NEW}
  fi
  config ${NEW}
}

config etc/chrony/chrony.conf.new
config etc/chrony/chrony.keys.new
config etc/logrotate.d/chrony.new
config etc/rc.d/rc.chronyd.new
preserve_perms etc/rc.d/rc.chronyd.new

chown ntp:ntp var/lib/chrony var/log/chrony
chmod 750 var/lib/chrony

