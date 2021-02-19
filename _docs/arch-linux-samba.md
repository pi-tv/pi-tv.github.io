---
title: Arch linux samba
tags: [Arch, Linux, samba, SMB, Windows]
desc: Network share setup
---

# Arch linux samba
## Samba server setup
```bash
#!/bin/bash

pacman -Sy samba
man smb.conf
systemctl start smb
systemctl status smb
systemctl restart smb
```

## Create samba user
```bash
#!/bin/bash

useradd --create-home user
smbpasswd -a user
```

## Samba config "/etc/samba/smb.conf"
```
[global]
server role = STANDALONE
log level = 1 auth_audit:3 
log file = /var/log/samba/%J.log
max log size = 10000
create mask = 0600
directory mask = 0700

[private]
comment = Private share
path = /share/private
valid users = user
public = no
writeable = yes

[public]
map to guest = Bad Password
comment = Public share
path = /share/public
public = yes
writeable = no
```


## Windows client
```cmd
net use U: "\\myarch\private" /user:user
net use U: /delete
net use "\\myarch\private" /delete
```

```cmd
net use V: "\\myarch\public"
net use V: /delete
```

## Linux client
Mount share:
```bash
#!/bin/bash

man mount.cifs
mount -t cifs //myarch/private /mnt/myarch_private -o user=user,pass=****
```
No-mount access:
```bash
#!/bin/bash

smbget --user user smb://myarch/myarch/test.txt
```