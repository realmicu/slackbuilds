K3S_USER="k3sadm"
K3S_GROUP="k3sadm"
K3S_UID=4000
K3S_GID=4000
K3S_HOME="home/$K3S_USER"

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

config etc/default/k3s.new
config etc/rc.d/rc.k3s.new
config etc/logrotate.d/k3s.new

if ! grep -q "^$K3S_USER:" etc/passwd ; then
  cp -a etc/passwd etc/passwd.new
  echo "$K3S_USER:x:$K3S_UID:$K3S_GID:User for K3S:/$K3S_HOME:/bin/bash" >> etc/passwd.new
fi

if ! grep -q "^$K3S_USER:" etc/shadow ; then
  cp -a etc/shadow etc/shadow.new
  echo "$K3S_USER:*:9797:0:::::" >> etc/shadow.new
fi

if ! grep -q "^$K3S_GROUP:" etc/group ; then
  cp -a etc/group etc/group.new
  echo "$K3S_GROUP:x:$K3S_GID:" >> etc/group.new
fi

if ! grep -q "^$K3S_GROUP:" etc/gshadow ; then
  cp -a etc/gshadow etc/gshadow.new
  echo "$K3S_GROUP:!::" >> etc/gshadow.new
fi

if ! grep -q "$K3S_USER:" etc/subuid ; then
  cp -a etc/subuid etc/subuid.new
  echo "$K3S_USER:${K3S_UID}00:65536" >> etc/subuid.new
fi

if ! grep -q "$K3S_GROUP:" etc/subgid ; then
  cp -a etc/subgid etc/subgid.new
  echo "$K3S_GROUP:${K3S_GID}00:65536" >> etc/subgid.new
fi

mkdir -pm 750 $K3S_HOME
chown $K3S_UID:$K3S_GID $K3S_HOME
