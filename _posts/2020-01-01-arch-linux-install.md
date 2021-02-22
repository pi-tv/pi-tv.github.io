---
title: Arch Linux install
tags: [Arch Linux, Linux]
desc: Install Arch Linux
date: 2020-12-25
---

# Arch Linux install

## From ISO
See [Installation guide](https://wiki.archlinux.org/index.php/installation_guide)

## On existing Arch using a local mirror
Conditions:
- [Arch pacman local mirror](/arch-linux-pacman-local-mirror) exists and mounted to "/mirror"
- Prepared target partition is /dev/sdd1

On master Arch system:
```bash
pacman -Sy arch-install-scripts

mkfs.ext4 /dev/sdd1
mkdir /mnt/creation
mount /dev/sdd1 /mnt/creation

pacstrap /mnt/creation base linux man pacman mc vim netctl htop syslinux
#+arch-firmware for real machines

mount --bind --read-only /mirror /mnt/creation/mirror
arch-chroot /mnt/creation
```

In chroot environment of the new system: 
```bash
echo 'Server=file:///mirror/$repo/os/$arch' >/etc/pacman.d/mirrorlist

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
echo 'en_US.UTF-8 UTF-8' >/etc/locale.gen
localectl set-locale en_US.UTF-8
locale-gen

cat >/etc/fstab <<EOF
/dev/sda1  /        ext4  rw,relatime  0 1
/dev/sdb1  none     swap  defaults     0 0
/dev/sdc   /mirror  ext4  ro,relatime  0 2
EOF

cat >/boot/syslinux/syslinux.cfg <<EOF
DEFAULT arch
PROMPT 0
TIMEOUT 0

LABEL arch
    LINUX ../vmlinuz-linux
    APPEND root=/dev/sda1 rw vga=773 quiet splash
    INITRD ../initramfs-linux.img
EOF

/usr/bin/syslinux-install_update -iam
passwd
exit
```

Again on master Arch system:
```bash
mount /dev/sdd1
rm /mnt/creation
```

## Related links
- [Partitions](/arch-linux-partitions)
- [Pacman local mirror](/arch-linux-pacman-local-mirror)
- [Cleanup](/arch-linux-cleanup)
- [Network](/arch-linux-network)
- [SSH](/arch-linux-ssh)
