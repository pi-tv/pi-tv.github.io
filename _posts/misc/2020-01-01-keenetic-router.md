---
title: Keenetic router
tags: [Keenetic, Linux]
desc: Tune Keenetic router
date: 2021-03-09
---

# Keenetic router

## Enable DNS on router

- Open CLI via telnet or web-interface[http://192.168.1.1/a](http://192.168.1.1/a)
- Run `ip dhcp pool _WEBADMIN update-dns`
- Run `system configuration save`

### On linux machine

Uncomment "hostname" (Inform the DHCP server of our hostname) in the "/etc/dhcpcd.conf"

### On Windows machine

Clear DNS cache via `ipconfig /flushdns` command.
