---
title: Linux memory
tags: [Linux, Memory]
commands: [free, lshw, lsmem, vmstat]
desc: Memory usage diagnostic in Linux.
date: 2022-02-04
---

# Linux memory

- `free -hw` - amount of free and used memory in the system (`-h, --human`, `-w, --wide`)
- `vmstat -s`- event counters and memory statistics (`-s, --stats`)
- `vmstat -dw`  - disks activity statistics (`-d, --disk`, `-w, --wide`)
- `vmstat -D` - disks activity summary statistics (`-D, --disk-sum`)
- `vmstat -p /dev/sda1` - disk partition activity statistics (`-p, --partition`)
- `cat /proc/meminfo` - misc info about memory
- `lshw -class memory` - info about memory devices
- `lsmem` -  list the ranges of available memory
