---
title: Arch Linux docker 
tags: [Arch Linux, Docker]
ctags: [docker, pacman, wget]
desc: Create docker images from scratch. 
date: 2022-01-08
---

# Arch Linux docker

Sometimes it is necessary to create docker containers in an isolated
environment (without an external docker hub, external software repositories and internet access at
all). With a local [Arch Linux mirror](/arch-linux-mirror) you have almost all for this.

## Setup docker

```shell
sudo pacman -Sy docker
sudo usermod -aG docker $USER
sudo systemctl start docker
````

## Build docker images from the Arch Linux base ROOTFS

Personally I don't like this way. Arch Linux base image is much bigger comparing to Alpine, Ubuntu
or many other vendors. It's size is about 500MB and it contains tons of unnecessary files.

### Pre-conditions

- System with Arch Linux installed (see [Arch Linux install](/arch-linux-install))
- There is a local pacman mirror (see [Arch Linux mirror](/arch-linux-mirror))
- Arch Linux ROOTFS downloaded from the "gitlab.archlinux.org":

```bash
wget -c --content-disposition -P /mirror/archlinux-docker \
  https://gitlab.archlinux.org/archlinux/archlinux-docker/-/package_files/357/download 
wget -c --content-disposition -P /mirror/archlinux-docker \
  https://gitlab.archlinux.org/archlinux/archlinux-docker/-/package_files/358/download
```

### Import base image

```bash
docker import /mirror/archlinux-docker/base-20201222.0.11875.tar.xz archbase:20201222
docker images

#REPOSITORY   TAG        IMAGE ID       CREATED         SIZE
#archbase     20201222   09a43bc2471b   4 minutes ago   407MB

docker run --rm -it archbase:20201222 bash
```

### Create images

Build `docker build -t myarch .` from this Dockerfile:

```shell
FROM archbase:20201222

RUN echo 'Server=http://172.17.0.1/mirror/archlinux/$repo/os/$arch' >/etc/pacman.d/mirrorlist

RUN pacman -Suy --noconfirm --needed nginx

```

## Arch Linux docker images from scratch

What would be better than something created from scratch?

It is pretty simple to create a base image based on Arch Linux.

What is a base software:

- almost all packages require "glibc" and "gcc-libs" (224MB)
- also it is nice to have "coreutils" and "bash" (+65MB, 289MB)
- pacman, to install packages in next images (+89MB, 378MB)
- plus optionally "python" (+87MB, 465MB)
- the total size of this base software is about 465MB
- but it is possible to reduce it a bit by excluding some files via pacman (-109MB, 356MB)
- and reduce it a bit more by removing some files (-7MB, 349MB)

### Prepare files

```shell
FILES=myarchbase-files

rm -rvf $FILES
mkdir -pv $FILES/etc/pacman.d $FILES/var/lib/pacman

cat >$FILES/etc/locale.conf <<EOF
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
EOF

cat >$FILES/etc/locale.gen <<EOF
en_US.UTF-8 UTF-8
EOF

cat >$FILES/etc/pacman.d/mirrorlist <<EOF
Server = http://mirror.local/mirror/archlinux/\$repo/os/\$arch
EOF

cat >$FILES/etc/pacman.conf <<EOF
[options]
Architecture = x86_64
SigLevel = Never
Include = /etc/pacman.d/noextract

[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

[community]
Include = /etc/pacman.d/mirrorlist
EOF

cat >$FILES/etc/pacman.d/noextract <<EOF
# Exclude unnecessary files
NoExtract = usr/include/*
NoExtract = usr/share/doc/*
NoExtract = usr/share/i18n/charmaps/* 
NoExtract = !usr/share/i18n/charmaps/UTF-8.gz
NoExtract = usr/share/i18n/locales/*
NoExtract = !usr/share/i18n/locales/en_US 
NoExtract = !usr/share/i18n/locales/en_GB
NoExtract = !usr/share/i18n/locales/i18n*
NoExtract = !usr/share/i18n/locales/iso*
NoExtract = !usr/share/i18n/locales/translit*
NoExtract = usr/share/iana-etc/*
NoExtract = usr/share/info/*
NoExtract = usr/share/gtk-doc/*
NoExtract = usr/share/licenses/*
#NoExtract = usr/share/locale/* 
#NoExtract = !usr/share/locale/en_GB/*
#NoExtract = !usr/share/locale/en_US/*
#NoExtract = !usr/share/locale/locale.alias
NoExtract = usr/share/man/*
NoExtract = usr/share/pixmaps/*
NoExtract = usr/share/readline/*

# Exclude prepared files
NoExtract = etc/locale.conf
NoExtract = etc/locale.gen
NoExtract = etc/pacman.conf
NoExtract = etc/pacman.d/mirrorlist
NoExtract = etc/pacman.d/noextract
EOF
```

### Create base filesystem

```shell
FILES=myarchbase-files
OUTPUT=/tmp/myarchbase

sudo rm -rf $OUTPUT
sudo mkdir -pv $OUTPUT/var/lib/pacman
sudo cp -r $FILES/* $OUTPUT/
#sudo pacman -Svy --noconfirm --needed --sysroot $OUTPUT glibc gcc-libs coreutils bash pacman sed less
pacstrap -cGiM $OUTPUT glibc gcc-libs coreutils bash pacman sed less
sudo du -sh $OUTPUT
sudo chroot $OUTPUT rm -rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/*
sudo chroot $OUTPUT locale-gen
sudo du -sh $OUTPUT
```

### Import base filesystem as base image

```text
sudo tar -cJf $OUTPUT.tar.xz $OUTPUT
sudo tar -cjf /tmp/vault-base.tbz -C /tmp/vault-base .
docker import /tmp/myarchbase myarchbase
docker images
docker run --rm -it myarchbase bash
```

## Links

- [Arch Linux mirror](/arch-linux-mirror)
- [archlinux-docker](https://gitlab.archlinux.org/archlinux/archlinux-docker)