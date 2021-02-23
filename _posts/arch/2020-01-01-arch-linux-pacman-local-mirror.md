---
title: Arch Linux pacman local mirror
tags: [Arch Linux, Linux, Mirror, Pacman]
desc: Make a local Arch mirror
date: 2020-12-25
---

# Arch Linux pacman local mirror
## Make a mirror
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

Set `Server=file:///mirror/archlinux/$repo/os/$arch` into the "/etc/pacman.d/mirrorlist".

Add `/dev/sdc  /mirror  ext4  ro,relatime  0 2` into the "/etc/fstab".

Mount via `mount /mirror` or via `mount --read-only /dev/sdc /mirror`
