---
title: Wget
tags: [HTTP]
commands: [wget]
date: 2021-03-11
---

# Wget

## Make a site mirror

Copy content of a remote site for offline viewing:

```bash
wget --mirror --no-parent --page-requisites --convert-links --adjust-extension \
  -U "Googlebot/2.1 (+http://www.google.com/bot.html)" \
  https://pi-tv.github.io \
  2>&1 | tee site-mirror.log
```

## Check broken site links
```bash
wget --spider --recursive --no-directories --no-verbose --level=3 --wait=1 \
  https://pi-tv.github.io \
  2>&1 | tee site-check.log
  
grep -B1 'broken link!' site-check.log
```
