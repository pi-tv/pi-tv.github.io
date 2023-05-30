---
title: Arch Linux install
tags: [Arch Linux, Install, Syslinux, VirtualBox]
commands: [fdisk, arch-chroot, mount, pacman, pacstrap, systemctl]
desc: Install Arch Linux.
date: 2021-03-11
---

# Arch Linux install

## Pre-conditions:

- Installation into the VirtualBox
    - Host-Only network adapter is enabled
- Install from the Arch ISO
- Target partition is "/dev/sda1"
- Swap partition is "/dev/sdb"
- Optional: there is a local pacman mirror partition at "/dev/sdc" (see [Arch Linux mirror](/arch-linux-mirror))

## Initial SSH setup (optional)

It is much more comfortable to copy-paste commands from host machine via SSH. Enable SSH access:

```bash
passwd
systemctl start sshd
```

## Prepare disks

```bash
lsblk
fdisk /dev/sda
> n
> p
> 1
> enter
> enter
> w

mkfs.ext4 /dev/sda1 -L root
mkswap /dev/sdb -L swap
```

## Optional: mount a local mirror

```bash
mkdir /mirror
mount -r /dev/sdc /mirror

echo 'Server=file:///mirror/archlinux/$repo/os/$arch' >/etc/pacman.d/mirrorlist
mount -r /dev/sdc /mirror
```

## Locales

```bash
cat >/etc/locale.conf <<EOF
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
EOF

echo en_US.UTF-8 UTF-8 >/etc/locale.gen

locale-gen
```

## Install initial system

```bash
#pacman -Sy arch-install-scripts #don't need this when installing from ISO

mkdir /mnt/arch
mount /dev/sda1 /mnt/arch

pacstrap -K /mnt/arch base linux man pacman mc vim netctl wget syslinux bash-completion openssh dhcpcd sudo htop

mkdir /mnt/arch/mirror
mount --bind -r /mirror /mnt/arch/mirror
cp /etc/locale.conf /mnt/arch/etc
cp /etc/locale.gen /mnt/arch/etc
arch-chroot /mnt/arch
```

## In a chroot environment of the new system:

```bash
locale-gen
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

cat >/etc/fstab <<EOF
/dev/sda1  /        ext4  rw,relatime  0 1
/dev/sdb   swap     swap  defaults     0 0
#/dev/sdc   /mirror  ext4  ro           0 2
EOF

cat >/boot/syslinux/syslinux.cfg <<EOF
DEFAULT linux
PROMPT 0
TIMEOUT 0

LABEL linux
    LINUX ../vmlinuz-linux
    APPEND root=/dev/sda1 rw vga=773
    INITRD ../initramfs-linux.img
EOF

syslinux-install_update -iam
passwd
exit
```

Again on the master Arch system:

```bash
umount /dev/sda1
rm /mnt/arch
```

Reboot to the new Arch and then:

```bash
hostnamectl set-hostname myarch
hostnamectl status

systemctl enable dhcpcd
systemctl start dhcpcd
systemctl status dhcpcd

ping ya.ru

#Add `PermitRootLogin yes` in the "/etc/ssh/sshd_config" to allow root login via SSH.
systemctl enable sshd
systemctl start sshd
systemctl status sshd
```

## Add user

```bash
useradd -m -s /bin/bash user
passwd user
```

Add sudo access to the user via `sudo EDITOR=vim visudo`, add this line:
`user ALL=(ALL) ALL`

## Next steps

- [Arch Linux cleanup](/arch-linux-cleanup)
- [Setup network](/linux-network)
- [Setup Xfce](/xfce)
- [Setup Firefox](/firefox)

## Links

- [Arch Linux mirror](/arch-linux-mirror)
