---
title: Arch Linux mirror
tags: [Arch Linux, Nginx, Pacman]
ctags: [mount, rsync]
desc: Make a local Arch mirror.
date: 2022-01-29
---

# Arch Linux mirror

## Make a mirror

Arch repository contains almost all software I need. It's size is about 50GB+ of packages.

Script to make a local mirror:

```bash
#!/bin/bash

SOURCE=rsync://mirror.yandex.ru/archlinux
TARGET=/mirror/archlinux

RSYNC_OPTS=(
  --recursive --hard-links --safe-links --copy-links --times --delete-after --delay-updates
  --info=progress2
  --filter="merge archlinux-filter.lst"
  --dry-run --stats --human-readable
)

rsync "${RSYNC_OPTS[@]}" $SOURCE/core $TARGET
rsync "${RSYNC_OPTS[@]}" $SOURCE/extra $TARGET
rsync "${RSYNC_OPTS[@]}" $SOURCE/community $TARGET
rsync "${RSYNC_OPTS[@]}" $SOURCE/iso $TARGET
```

But Arch repository has tons of garbage (some ugly packages like "kea-devel-docs" or national
translations). See [Disk usage](#mirror-disk-usage) section. They can be excluded from mirroring
using "--filter" option and this "archlinux-filter.lst" file with includes and excludes for rsync:

```text
- /community/os/x86_64/kea-devel-docs-*

+ /community/os/x86_64/firefox-developer-edition-i18n-en-us-*
- /community/os/x86_64/firefox-developer-edition-i18n-*
+ /community/os/x86_64/gimp-help-en-*
- /community/os/x86_64/gimp-help-*

+ /extra/os/x86_64/firefox-i18n-en-us-*
- /extra/os/x86_64/firefox-i18n-*
+ /extra/os/x86_64/libreoffice-fresh-en-*
- /extra/os/x86_64/libreoffice-fresh-[a-z]*
+ /extra/os/x86_64/libreoffice-still-en-*
- /extra/os/x86_64/libreoffice-still-[a-z]*
+ /extra/os/x86_64/thunderbird-i18n-en-us-*
- /extra/os/x86_64/thunderbird-i18n-*
+ /extra/os/x86_64/vim-spell-en-*
- /extra/os/x86_64/vim-spell-*

+ /iso/latest
+ /iso/latest/*
- /iso/**
```

## Use the mirror via a local filesystem

Set `Server=file:///mirror/archlinux/$repo/os/$arch` into the "/etc/pacman.d/mirrorlist".

Personally I keep the mirror on a separate disk ("/dev/sdc"), so I mount it as read-only:

- Add `/dev/sdc /mirror  ext4  ro,relatime  0 2` into the "/etc/fstab".
- Mount via `mount /mirror` or via `mount --read-only /dev/sdc /mirror`

## Use the mirror via a local webserver

- Nginx config section to serve mirror files:

```text
    location /mirror/archlinux/ {
        alias /mirror/archlinux/;
        autoindex on;
        expires max;
    }
```

Set `Server=http://localhost/mirror/archlinux/$repo/os/$arch` into the "/etc/pacman.d/mirrorlist".

## Mirror disk usage

Originally the mirror spends 57.9GB of disk space:

- core: 1.10GB
- extra: 9.87GB
- community: 45.03GB
- iso: 1.90GB

But with the specified includes/excludes it spends a bit less, 54.86GB:

- core: 1.10GB
- extra: 9.24GB
- community: 43.44GB
- iso: 1.08GB

## Links

- [Pacman](/pacman)