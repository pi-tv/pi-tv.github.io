---
layout: post
title: Test
tags: [test]
---

# Test 123


## Analyze disk usage

```bash
#!/bin/bash

df -h /
du -shx / #-x, --one-file-system
du -cshx /boot /usr /var #-c, --total
du -cshx /var/*
du -cshx /usr/share/* |sort -h
echo Disk usage $(du -sh /usr/share)
```