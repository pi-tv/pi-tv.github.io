---
title: Linux network
tags: [Linux, Network]
desc: Configure network in Linux.
date: 2021-02-21
---

# Linux network

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

- [Samba](/samba)
- [SSH](/ssh)