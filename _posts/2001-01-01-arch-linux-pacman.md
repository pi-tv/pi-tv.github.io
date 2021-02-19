---
title: Arch linux pacman
tags: [Arch, Linux, pacman]
desc: Pacman memos
date: 2020-12-25
---

# Arch linux pacman
## System upgrade
```bash
pacman -Sy archlinux-keyring
pacman -Syu
```

## Searches
```bash
pacman -F hostname # find a file
pacman -Qs hostname # find a package
pacman -Qi systemd # info about the package
pacman -Ss qemu # list packages
```

## Clear pacman cache
```bash
pacman -Scc
```

## Related links
[Pacman local mirror](/arch-linux-pacman-local-mirror)