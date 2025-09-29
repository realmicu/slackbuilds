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

config etc/containers/containers.conf.new
config etc/containers/registries.conf.new
config etc/containers/seccomp.json.new
config etc/containers/policy.json.new
config etc/containers/storage.conf.new
config etc/cni/net.d/87-podman-bridge.conflist.new
config etc/modprobe.d/overlay.conf.new
