---
title: Arch Linux pacman
tags: [Arch Linux, Linux, Pacman]
desc: Pacman memos. Make a local Arch mirror.
date: 2021-03-11
---

# Arch Linux pacman

## System upgrade
```bash
pacman -Sy archlinux-keyring
pacman -Syu
```

## Searches

- `pacman -F hostname` - find a file
- `pacman -Qs hostname` - find a package
- `pacman -Qi systemd` - info about the package
- `pacman -Ss qemu` - list packages


## Misc

- `pacman -Rs package` - remove package with dependencies
- `pacman -Scc` - clear pacman cache


## Arch Linux local mirror

Script to make a local mirror:
```bash
#!/bin/bash

SOURCE=rsync://mirror.yandex.ru/archlinux
TARGET=/mirror/archlinux

RSYNC_OPTS="--recursive --hard-links --safe-links --copy-links --times --delete-after --delay-updates"
RSYNC_OPTS="${RSYNC_OPTS} --info=progress2"
#RSYNC_OPTS="${RSYNC_OPTS} --dry-run --stats --human-readable"

rsync $RSYNC_OPTS $SRC/core $OUT
rsync $RSYNC_OPTS $SRC/extra $OUT
rsync $RSYNC_OPTS $SRC/community $OUT
rsync $RSYNC_OPTS $SRC/iso/latest $OUT
rsync $RSYNC_OPTS $SRC/lastsync $OUT
```

Then set `Server=file:///mirror/archlinux/$repo/os/$arch` into the "/etc/pacman.d/mirrorlist".

Personally I keep mirror on a separate disk ("/dev/sdc"), so I mount it as read-only:
- Add `/dev/sdc  /mirror  ext4  ro,relatime  0 2` into the "/etc/fstab".
- Mount via `mount /mirror` or via `mount --read-only /dev/sdc /mirror`
