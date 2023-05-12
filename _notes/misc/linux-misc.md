---
title: Linux misc
tags: [Linux]
date: 2021-03-11
---

# Linux misc

## Keep Ubuntu working on lid close

To keep working on laptop even if the lid is closed set `HandleLidSwitch=ignore` in the
"/etc/systemd/logind.conf" file.

Then restart the service: `sudo service systemd-logind restart`

Applicable at least for:

- Ubuntu 16.04 LTS

### Disable auto-updates in Ubuntu

```bash
apt remove unattended-upgrades
```
