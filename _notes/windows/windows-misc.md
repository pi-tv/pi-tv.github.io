---
title: Windows misc
tags: [Regedit, Windows, Wmic]
date: 2021-02-21
---

# Windows misc

## Add/Remove programs

### Wmic

Run `wmic` in the terminal and then:

- List all installed apps: `product get name`
- Uninstall by name: `product where name="ProgramNameToDelete" call uninstall`

## Power

### Turn off hibernate

As admin run in the terminal: `powercfg -h off`

## Misc

### Persistent subst

Make SUBST virtual disk persistent:

```shell
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "W:" /t REG_SZ /d "subst T: C:\Temp" /f
```
