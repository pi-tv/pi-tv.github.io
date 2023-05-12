---
title: Far Manager
tags: [Far Manager, Rar]
date: 2021-02-21
---

# Far Manager

## Create menu item for making backups

- Add a directory where "rar.exe" is located into the PATH (or use a full path in the command)
- Open `Far -> F2 -> Insert`
- Insert command
  - Label: `rar !.!`
  - Command: `rar a -r -m5 -k -s -ag-YYYY.MM.DD_HH.MM "!.!".rar "!.!"`
