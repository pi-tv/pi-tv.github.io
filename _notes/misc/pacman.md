---
title: Pacman
tags: [Linux, Pacman]
commands: [pacman]
desc: Pacman commands
date: 2021-03-11
---

# Pacman

## System upgrade

```bash
pacman -Sy archlinux-keyring
pacman -Syu
```

## Searches

- `pacman -F filename` - find a package containing the given file (like "/usr/bin/bash")
- `pacman -Qs package-name` - search installed package
- `pacman -Qi package-name` - info about the installed package
- `pacman -Ss package-name` - search package
- `pacman -Si package-name` - info about the package
- `pacman -Sii package-name | grep "Required By"` - list of packages depend on the specified package

## Misc

- `pacman -Rs package` - remove package with dependencies
- `pacman -Scc` - clear pacman cache
- `rm /var/lib/pacman/db.lck` - to unlock in case of "unable to lock database"

## Dependency tree

```shell
sudo pacman -Sy pacman-contrib
pactree -s package-name
```

## Links

- [Arch Linux mirror](/arch-linux-mirror)
