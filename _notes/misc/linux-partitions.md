---
title: Linux partitions
tags: [Linux]
tags: [fdisk, Linux]
desc: Partition management in Linux.
date: 2020-12-25
---

# Linux partitions

## Disks info

```bash
lsblk
fdisk -l
```

## Create single full-sized partition

```shell
fdisk /dev/sda

> n
> p
> 1
>
> w
```