---
title: Ubuntu keep working on closed lid
tags: [Ubuntu, Linux]
desc: Keep working on laptop even if the lid is closed
---

# Ubuntu keep working on closed lid

To keep working on laptop even if the lid is closed
set `HandleLidSwitch=ignore` in the "/etc/systemd/logind.conf" file. 

Then restart the service: `sudo service systemd-logind restart`

Applicable at least for:
- Ubuntu 16.04 LTS 
