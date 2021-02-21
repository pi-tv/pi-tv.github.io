---
title: Windows notes
tags: [Windows, Subst, Wmic]
desc: Miscelanous Windows notes 
date: 2021-02-21
---

# Windows notes

## Persistent subst
Make SUBST virtual disk persistent:
```shell
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "W:" /t REG_SZ /d "subst T: C:\Temp" /f
```

## Wmic
List all installed apps: `product get name`
Uninstall by name: `product where name="ProgramNameToDelete" call uninstall`

## Turn off hibernate
As admin: `powercfg -h off`