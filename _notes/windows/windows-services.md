---
title: Windows services
tags: [Regedit, Services, Windows]
desc: Windows services management.
date: 2021-02-21
---

# Windows services

## SC

- Delete service: `sc delete myServiceName`
- Disable service: `sc config myServiceName start=disabled`
- Stop service: `sc stop myServiceName`

## Regedit

Disable service:

```shell
reg query "HKLM\SYSTEM\CurrentControlSet\Services\myServiceName" /v Start
reg add "HKLM\SYSTEM\CurrentControlSet\Services\myServiceName" /v Start /t REG_DWORD /f /d 4
```

## Batch script to manage multiple services at once

Imagine you have a list of services in a plain text file named "my-services.txt":

```text
DcpSvc
DiagTrack
lfsvc
RemoteRegistry
tzautoupdate
```

Stop and disable all together:

```shell
echo off

for /f "eol=#" %%i in (my-services.txt) do call :disable %%i
exit

:disable
set SVC=%1
echo %SVC%
sc stop %SVC%
reg add "HKLM\SYSTEM\CurrentControlSet\Services%SVC%" /v Start /t REG_DWORD /f /d 4
sc config %SVC% start=disabled
exit /b
```

And enable them back on:

```shell
echo off

for /f "eol=#" %%i in (my-services.txt) do call :enable %%i
exit

:enable
set SVC=%1
echo %SVC%
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%SVC%" /v Start /t REG_DWORD /f /d 1
;sc query %SVC%
sc config %SVC% start=auto
sc start %SVC%
exit /b
```