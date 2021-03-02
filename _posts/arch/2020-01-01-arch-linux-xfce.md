---
title: Arch Linux Xfce
tags: [Arch Linux, Linux, Xfce]
desc: Install Arch Linux Xfce
date: 2021-03-01
---

# Arch Linux Xfce

## Install
```bash
pacman -Sy xorg-server xfce4 firefox
startxfce4
```

## Configure
Add this into the ".bash_profile" file to autostart Xfce when login on tty1:
```shell
if [ "$(tty)" = "/dev/tty1" -o "$(tty)" = "/dev/vc/1" ] ; then
  startxfce4
fi
```

## Cleanup
- Remove some unwanted menu-items (".desktop" files) from /usr/share/applications
- Set `Categories=X-Xfce-Toplevel` for some menu-items (by editing the ".desktop" files)

