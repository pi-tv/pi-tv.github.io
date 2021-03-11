---
title: Arch Linux X-Server
tags: [Arch Linux, Linux, X, VcXsrv, Windows, Firefox]
desc: Connect to X-Server on Arch
date: 2020-12-25
---

# Arch Linux X-Server
## Linux side
- Install `pacman -Sy xorg-xauth`
- Enable `X11Forwarding yes` in the "/etc/ssh/sshd_config", restart sshd.

## Windows side
### Putty
- `Connection -> SSH -> X11 -> Enable X11 forwarding`
- `Connection -> SSH -> Cipher = Arcfour`

### VcXsrv
- `XLaunch -> Properties -> Compability -> Change high DPI settings = Application`

## X-Sever apps
### Linux side
- Install `pacman -Sy firefox`
- Run `firefox`

### Windows side
- `Firefox -> about:config -> gfx.xrender.enabled = true`
- Use it from Windows