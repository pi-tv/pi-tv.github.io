---
title: PowerShell
tags: [PowerShell, RunAs, Windows]
desc: Powershell tricks 
date: 2021-02-21
---

# PowerShell

Run: `powershell -NonInteractive -ExecutionPolicy Bypass -File myScript.ps1 %*`

## RunAs

Run headless Google Chrome under the particular user and take a screenshot using Powershell:

```shell
echo "PS Args: $args"

$ProcessInfo = New-Object System.Diagnostics.ProcessStartInfo
$ProcessInfo.FileName = "c:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
$ProcessInfo.EnvironmentVariables["MY_VAR"] = "MY_VALUE";
$ProcessInfo.EnvironmentVariables["PATH"] = $env:PATH + ";C:\MyPath";
$ProcessInfo.UseShellExecute = $true
$ProcessInfo.UseShellExecute   = $false
$ProcessInfo.CreateNoWindow  = $false
$ProcessInfo.Arguments = "--headless", "--disable-gpu", "--virtual-time-budget=10000", "--screenshot=chrome.png", "--window-size=1024,768" "http://localhost"
$ProcessInfo.Arguments = $args
$ProcessInfo.Username = $env:MY_USERNAME
$ProcessInfo.Domain = $env:MY_DOMAIN
$ProcessInfo.PasswordInClearText = $env:MY_PASSWORD
$Process = New-Object System.Diagnostics.Process
$Process.StartInfo = $ProcessInfo
$Process.Start() 
echo "PS Wait"
$Process.WaitForExit()
echo "PS Done"
```