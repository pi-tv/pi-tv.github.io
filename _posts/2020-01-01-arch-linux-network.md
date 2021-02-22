---
title: Arch Linux network
tags: [Arch Linux, Linux, Network]
desc: Configure linux network
partitions
---

# Arch Linux network

## Install network tools
```bash
pacman -Sy net-tools
```

## Set hostname
```bash
hostnamectl set-hostname myarch
hostnamectl status
```

## DHCP Client
```bash
pacman -Sy dhcpcd
systemctl enable dhcpcd
systemctl start dhcpcd
ip address
```

## Related links
- [Samba](/arch-linux-samba)
- [SSH](/arch-linux-ssh)