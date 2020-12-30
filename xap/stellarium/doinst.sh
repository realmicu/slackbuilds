[ -x /usr/bin/update-desktop-database ] && /usr/bin/update-desktop-database -q usr/share/applications >/dev/null 2>&1
[ -x /usr/bin/gtk-update-icon-cache ] && /usr/bin/gtk-update-icon-cache -t -f usr/share/icons/hicolor >/dev/null 2>&1
[ -x /usr/bin/update-mime-database ] && /usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
