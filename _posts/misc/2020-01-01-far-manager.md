---
title: Far Manager
tags: [Far Manager, Windows]
desc: Tune Far Manager
date: 2021-02-21
---

# Far manager

## Create menu item for making backup

- Add a directory where "rar.exe" is located into the PATH
- Open `Far -> F2 -> Insert`
- Insert command
  - Label: `rar !.!`
  - Command: `rar a -r -m5 -k -s -ag-YYYY.MM.DD_HH.MM "!.!".rar "!.!"`
