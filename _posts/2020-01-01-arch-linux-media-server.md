---
title: Arch Linux media server
tags: [Arch Linux, Linux, DLNA, Media Server]
desc: Setup home media server
date: 2020-12-25
---

# Arch Linux media server
## Minidlna
Install `pacman -Sy minidlna`. 
Configure "/etc/minidlna.conf"
```properties
port=8200
user=minidlna
media_dir=V,/media/Video
friendly_name=MyArch DLNA
```

```shell script
systemctl enable minidlna
systemctl start minidlna
```