---
title: Setup Wi-Fi on Ubuntu Server
tags: [Ubuntu, Linux, Network]
desc: Configure Wi-Fi on Ubuntu Server
date: 2018-05-09
---

# Setup Wi-Fi on Ubuntu Server

Ubuntu Server (16.04 LTS) installer provides a handy interface to setup Wi-Fi during the installation.
But when I've completed installation and restarted the server - Wi-Fi was not available. 
Installer doesn't store such configuration, and I have to configure Wi-Fi again.

Ok, do it manually.

First, I need to know the name of the wireless interface:

```bash
iwconfig
```
this command says that it's name is "wlp1s0"

Ok, I'm placing this new section into the "/etc/network/interfaces" file:

```text
auto wlp1s0
iface wlp1s0 inet dhcp
    wpa-ssid my_wifi_name
    wpa-psk  my_wifi_password
```
\* Replace my_wifi_name and my_wifi_password with your actual values.

And then I'm applying new network config via the: `sudo service networking restart`

Now it works: `ping ya.ru`

