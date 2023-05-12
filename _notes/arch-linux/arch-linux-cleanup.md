---
title: Arch Linux cleanup
tags: [Arch Linux, Cleanup]
ctags: [df, du, find, pacman]
desc: Remove unnecessary files from Arch Linux.
date: 2022-02-02
---

# Linux cleanup

Disk space matters.

Linux includes a lot of redundant files. As a German - do you need man files or locales in Japanese?
In most cases - No.

## Analyze disk usage

- `df -h /` - disk size, used and free space for root
- `du -shx /` - total files size on the root (`-x` or `--one-file-system`)
- `du -cshx /boot /usr /var` - size of specified directories (`-c` or `--total`)
- `du -cshx /var/*` - sizes of directories inside the /var
- `du -cshx /usr/share/* | sort -h` - sizes + sorting by size

## Cleanup boot

```bash
rm /boot/initramfs-linux-fallback.img
```

## Cleanup mans

```bash
(cd /usr/share/man && find ! -path "./man*" -delete)
```

### Get rid of mandb

```bash
systemctl disable man-db
rm -rf /var/cache/man
```

## Cleanup locales

```bash
(cd /usr/share/locale && find ! -path "./en_US*" ! -path "./en_GB*" ! -path "./en@*" -delete)
(cd /usr/share/i18n/locales && find ! -name "POSIX" ! -name "en_US" -delete)
```

## Cleanup docs

```bash
rm -rf /usr/share/doc
rm -rf /usr/share/info
rm -rf /usr/share/gtk-doc
```

## Clear pacman cache

```bash
pacman -Scc
```
