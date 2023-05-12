---
title: Sysinternals
tags: [Sysinternals, Windows, RunAs]
date: 2021-02-21
---

# Sysinternals

## PsExec

Run headless Google Chrome under the particular user and take a screenshot using PsExec:

```shell
psexec -accepteula -u myDomain\myUsername -p myPassword ^
  "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ^
  --headless --disable-gpu --virtual-time-budget=10000  ^
  --screenshot="chrome.png" --window-size=1024,768 ^
  --auth-server-whitelist="*" --auth-schemes="negotiate,ntlm,digest" ^
  "http://localhost"
```