---
title: Ubuntu misc
tags: [Ubuntu, Linux]
desc: Ubuntu misc
date: 2021-03-11
---

# Ubuntu misc
## Ubuntu keep working on closed lid

To keep working on laptop even if the lid is closed
set `HandleLidSwitch=ignore` in the "/etc/systemd/logind.conf" file. 

Then restart the service: `sudo service systemd-logind restart`

Applicable at least for:
- Ubuntu 16.04 LTS 
