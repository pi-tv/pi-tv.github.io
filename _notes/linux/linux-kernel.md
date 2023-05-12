---
title: Linux kernel 
tags: [Kernel, Linux, Syslinux]
date: 2021-12-30
---

# Linux kernel

## Kernel parameters

- mitigations=off - Disable all optional CPU mitigations. This improves system performance.
- srbds=off - Disable mitigation and remove performance impact to RDRAND and RDSEED.

## Syslinux config
```
DEFAULT linux
PROMPT 0
TIMEOUT 0

LABEL linux
    LINUX ../vmlinuz-linux
    APPEND root=/dev/sda1 rw vga=773 mitigations=off
    INITRD ../initramfs-linux.img
```

## Links

- [Linux kernel build](/linux-kernel-build)
- [Kernel parameters](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html)