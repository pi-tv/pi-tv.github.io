---
title: Samba 
tags: [Linux, Samba, Windows]
desc: Network SMB share setup.
date: 2020-12-25
---

# Samba

## Samba server setup

```bash
pacman -Sy samba
man smb.conf
systemctl start smb
systemctl status smb
systemctl restart smb
```

## Create samba user

```bash
useradd --create-home user
smbpasswd -a user
```

## Samba server config "/etc/samba/smb.conf"

```ini
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

```shell
net use U: "\\myarch\private" /user:user
net use U: /delete
net use "\\myarch\private" /delete
```

```shell
net use V: "\\myarch\public"
net use V: /delete
```

## Linux client

To install the client software only: `pacman -Sy cifs-utils`

### No-mount access

```bash
smbget --user user smb://myarch/myarch/test.txt
```

### Mount share via mount

```bash
man mount.cifs
mount -t cifs //host/dir /mnt/host_dir -o user=user,pass=****
```

### Mount share via systemd

Create "/etc/systemd/system/mnt-host_dir.mount" having this content:

```ini
[Unit]
Description=Share mount

[Mount]
What=//myarch/Share
Where=/mnt/host_dir
Options=_netdev,username=user,password=******,iocharset=utf8,rw
Type=cifs
TimeoutSec=30
```

Then:

```bash
systemctl start mnt-host_dir.mount
systemctl status mnt-host_dir.mount
```

#### Automount

Create "/etc/systemd/system/mnt-host_dir.automount" having this content:

```ini
[Unit]
Description=Share auto-mount

[Mount]
Where=/mnt/host_dir
TimeoutIdleSec=300

[Install]
WantedBy=multi-user.target
```