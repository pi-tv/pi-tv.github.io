---
title: Far Manager
tags: [Windows, Far Manager]
desc: Tune Far Manager
date: 2021-02-21
---

# Far manager

## Backup menu item

- Add a directory where "rar.exe" is located into the PATH
- Far -> F2 -> Insert command

Label: `rar !.!`
Command: `rar a -r -m5 -k -s -ag-YYYY.MM.DD_HH.MM "!.!".rar "!.!"`
