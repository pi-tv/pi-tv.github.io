---
title: Arch Linux install
tags: [Arch Linux, Linux]
desc: Install Arch Linux
date: 2020-12-25
---

# Arch Linux install

Pre-conditions:
- Target partition is /dev/sdd1
- Mirror partition is /dev/sdb
- [Arch pacman local mirror](/arch-linux-pacman-local-mirror) exists and mounted to "/mirror". I.e:
```bash
echo 'Server=file:///mirror/archlinux/$repo/os/$arch' >/etc/pacman.d/mirrorlist
mount -r /dev/sdb /mirror
```

On the master Arch system:
```bash
pacman -Sy arch-install-scripts #don't need when installing from ISO

mkfs.ext4 /dev/sdd1
mkdir /mnt/creation

mount /dev/sdd1 /mnt/creation

pacstrap /mnt/creation base linux man pacman mc vim netctl wget syslinux bash-completion
#+arch-firmware for real machines

mkdir /mnt/creation/mirror
mount --bind --read-only /mirror /mnt/creation/mirror
arch-chroot /mnt/creation
```

In chroot environment of the new system: 
```bash
echo 'Server=file:///mirror/archlinux/$repo/os/$arch' >/etc/pacman.d/mirrorlist

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

cat >/etc/locale.conf <<EOF
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
EOF

echo 'en_US.UTF-8 UTF-8' >/etc/locale.gen
locale-gen

cat >/etc/fstab <<EOF
/dev/sda1  /        ext4  rw,relatime  0 1
/dev/sdb   /mirror  ext4  ro           0 2
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

syslinux-install_update -iam
passwd
exit
```

Again on the master Arch system:
```bash
umount /dev/sdd1
rm /mnt/creation
```

Reboot to the new Arch and then:
```bash
hostnamectl set-hostname myarch
hostnamectl status

pacman -Sy dhcpcd
systemctl enable dhcpcd
systemctl start dhcpcd
systemctl status dhcpcd

ping ya.ru

pacman -Sy openssh
systemctl enable sshd
systemctl start sshd
systemctl status sshd
```

## Related links
- [Partitions](/arch-linux-partitions)
- [Pacman local mirror](/arch-linux-pacman-local-mirror)
- [Cleanup](/arch-linux-cleanup)
- [Network](/arch-linux-network)
- [SSH](/arch-linux-ssh)
- [Xfce](/arch-linux-xfce)
