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

config etc/mosquitto/mosquitto.conf.new
config etc/rc.d/rc.mosquitto.new

if ! grep -q '^mosquitto:' etc/passwd ; then
  cp -a etc/passwd etc/passwd.new
  echo "mosquitto:x:188:188:User for MQTT broker:/var/lib/mosquitto:/bin/false" >> etc/passwd.new
fi

if ! grep -q '^mosquitto:' etc/shadow ; then
  cp -a etc/shadow etc/shadow.new
  echo "mosquitto:*:9797:0:::::" >> etc/shadow.new
fi

if ! grep -q '^mosquitto:' etc/group ; then
  cp -a etc/group etc/group.new
  echo "mosquitto:x:188:" >> etc/group.new
fi

chown 188:188 var/lib/mosquitto
chmod 750 var/lib/mosquitto
