---
title: Linux wget
tags: [Linux, Wget]
desc: Create wget
date: 2021-03-11
---

# Linux wget
## Make a site mirror

Copy content of a remote site for offline viewing, "site-mirror.sh":

```bash
#!/bin/bash

SITE='https://pi-tv.github.io'

wget --mirror --no-parent --page-requisites --convert-links --adjust-extension $SITE 2>&1 |tee site-mirror.log
```