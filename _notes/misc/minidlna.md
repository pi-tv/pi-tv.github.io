---
title: Minidlna
tags: [Audio, DLNA, Linux, Video]
desc: Setup home media server.
date: 2020-12-25
---

# Minidlna

Install `pacman -Sy minidlna`. Configure "/etc/minidlna.conf"

```properties
port=8200
user=minidlna
media_dir=V,/media/Video
friendly_name=MyArch DLNA
```

```bash
systemctl enable minidlna
systemctl start minidlna
```