---
layout: post
title: Arch linux cleanup
tags: [Arch, Linux, Cleanup]
desc: Remove unnecessary linux files
---

# Arch linux cleanup

## Analyze disk usage

```shell
df -h /
du -shx / #-x, --one-file-system
du -cshx /boot /usr /var #-c, --total
du -cshx /var/*
du -cshx /usr/share/* |sort -h
echo Disk usage $(du -sh /usr/share)
```

## Cleanup /boot

```shell
rm /boot/initramfs-linux-fallback.img
```

## Cleanup mans

```shell
(cd /usr/share/man && find ! -path "./man*" -delete)
```

### Get rid of mandb

```shell
systemctl disable man-db
rm -rf /var/cache/man
```

## Cleanup locales

```shell
(cd /usr/share/locale && find ! -path "./en_US*" ! -path "./en@*" -delete)
(cd /usr/share/i18n/locales && find ! -name "POSIX" ! -name "en_US" -delete)
```

## Cleanup docs

```shell
rm -rf /usr/share/doc
rm -rf /usr/share/info
rm -rf /usr/share/gtk-doc
```

## Clear pacman cache

```shell
pacman -Scc
```