---
title: Arch linux cleanup
tags: [Arch, Linux, cleanup]
desc: Remove unnecessary linux files in Arch
date: 2020-12-25
---

# Arch linux cleanup

Sometimes disk space matters.

## Analyze disk usage
```bash
df -h /
du -shx / #-x, --one-file-system
du -cshx /boot /usr /var #-c, --total
du -cshx /var/*
du -cshx /usr/share/* |sort -h
echo Disk usage $(du -sh /usr/share)
```

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
(cd /usr/share/locale && find ! -path "./en_US*" ! -path "./en@*" -delete)
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