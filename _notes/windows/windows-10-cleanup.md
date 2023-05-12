---
title: Windows 10 cleanup
tags: [Debloat, PowerShell, Regedit, Windows]
date: 2021-07-11
---

# Windows 10 cleanup

## Disable updates

```shell
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t REG_DWORD /f /d 4
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /f /d 4
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /f /d 4
```

## Debloat

```shell
Get-AppxPackage Microsoft.GetHelp | Remove-AppxPackage
Get-AppxPackage Microsoft.DesktopAppInstaller | Remove-AppxPackage
Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage Microsoft.YourPhone | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage *Xbox* | Remove-AppxPackage
Get-AppxPackage *MicrosoftEdge* | Remove-AppxPackage
Get-AppxPackage *windowsstore* | Remove-AppxPackage
```

## Restore

### Restore removed Appx

```shell
Get-AppxPackage -AllUsers Microsoft.Xbox*Overlay | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
```
