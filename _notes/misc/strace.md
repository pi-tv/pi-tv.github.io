---
title: Strace
tags: [Linux, Debug]
tags: [strace]
desc: Trace system calls and signals.
date: 2021-12-10
---

# Strace

- `strace -p PID` - attach to the process with PID
- `strace -f -e openat program-name` - which files opened by the program-name (`-f, --follow-forks`)
