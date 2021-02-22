---
title: Arch Linux partitions
tags: [Arch Linux, Linux, fdisk]
desc: Partition management in Arch Linux
date: 2020-12-25
---

# Arch Linux partitions
## Disks info
```bash
lsblk
fdisk -l
```

## Create single full-sized partition
```shell
fdisk /dev/sdd
```
then:
```
> n 1
> t 83
> w
```