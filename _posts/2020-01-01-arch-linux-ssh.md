---
title: Arch SSH
tags: [Arch Linux, Linux, SSH]
desc: Configure SSH server
---

# Arch SSH
## SSH server setup
```shell script
pacman -Sy openssh
systemctl enable sshd
systemctl start sshd
```

## SSH server config
Add `PermitRootLogin yes` in the "/etc/ssh/sshd_config" to allow root login via SSH.
