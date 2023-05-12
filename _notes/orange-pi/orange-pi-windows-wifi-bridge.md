---
title: Orange Pi through the Windows Wi-Fi bridge
tags: [Armbian, Linux, Network, Orange Pi]
desc: Connect Orange Pi via Ethernet and bridge Wi-Fi in Windows.
date: 2017-06-12
---

# Orange Pi through the Windows Wi-Fi bridge

**Preconditions**:

- you have an Orange Pi board with Ethernet port
- you have installed on the Orange Pi
- you have a Windows laptop with both Ethernet and Wi-Fi
- you have an Ethernet-cable

![Orange Pi - Laptop - Access Point](/resources/orange-pi-through-windows-wifi-bridge/orange_pi-laptop-access_point.png)

## Step 1: Share Wi-Fi

Open Wi-Fi adapter settings and enable "Internet Connetsion Sharing":

![Share Wi-fi](/resources//orange-pi-through-windows-wifi-bridge/share-wifi-win-lan-access-1.png)

Remember IP-address from next confirmation window:

![Share confirmation](/resources//orange-pi-through-windows-wifi-bridge/share-wifi-win-lan-access-1.png)

As a result you will have a new LAN with DHCP.

## Step 2: Connect Orange Pi

- Connect Ethernet-cable to the Orange-P and to the laptop.
- Power on Orange Pi and wait for loading (about a minute).
- Orange Pi should boot and obtain IP-address from the laptop.
- Now you need to know this IP (if the monitor and keyboard are not connected to Orange Pi).

You need IP-address from the previous step and run this command: `arp -a -N 192.168.137.1`

Output looks like:

```shell
Interface: 192.168.137.1 --- 0xc
  Internet Address      Physical Address      Type
  192.168.137.85        41-7d-25-dd-f4-ff     dynamic
  192.168.137.255       ff-ff-ff-ff-ff-ff     static
  224.0.0.22            01-00-da-00-00-16     static
  224.0.0.251           01-00-da-00-00-fb     static
  224.0.0.252           01-00-da-00-00-fc     static
  239.255.255.250       01-00-da-7f-ff-fa     static
  255.255.255.255       ff-ff-ff-ff-ff-ff     static
```

Look for an address starting with "192.168.137" but not ending with ".1" or ".255" - this is a new
address of the Orange Pi.

Now you can connect to Orange Pi via SSH (in Armbian default username is **root** and password is **
1234**.

You may check internet connection, for example via the: `ping ya.ru`
