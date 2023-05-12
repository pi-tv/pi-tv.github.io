---
title: SSH
tags: [Linux, Remote, SSH]
date: 2020-12-25
---

# SSH

## SSH server setup

```bash
pacman -Sy openssh
systemctl enable sshd
systemctl start sshd
```

## SSH server config

Add `PermitRootLogin yes` in the "/etc/ssh/sshd_config" to allow root login via SSH.
