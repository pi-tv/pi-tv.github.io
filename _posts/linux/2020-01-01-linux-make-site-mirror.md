---
title: Linux make site mirror
tags: [Linux, Wget]
desc: Create a local copy of web site
date: 2007-06-11
---

# Linux make site mirror

Copy content of a remote site for offline viewing, "site-mirror.sh":

```bash
#!/bin/bash

SITE='https://pi-tv.github.io'

wget --mirror --no-parent --page-requisites --convert-links --adjust-extension $SITE 2>&1 |tee site-mirror.log

```