---
title: Orange Pi Zero network speed test
tags: [Armbian, Linux, Network, Orange Pi]
commands: [dd, nc]
desc: Measure ethernet and wi-fi speed in Orange Pi Zero.
date: 2019-07-25
---

# Orange Pi Zero network speed test

Measurement was performed for Orange Pi Zero (with 512MB of RAM). It has:

- Ethernet 10/100M
- Wi-Fi 802.11 b/g/n

## Ethernet speed test

![Orange Pi to PC via Ethernet](/resources/orange-pi-zero-network-speed-test/orange_pi-laptop-ethernet.png)

### Speed test from Orange Pi to PC via Ethernet

Start network listener on PC:

```bash
nc -l 192.168.11.10 12345 >/dev/null
```

Transfer 100 megabytes from Orange Pi to PC:

```shell
$ dd if=/dev/zero bs=1M count=100 | nc 192.168.11.10 12345
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 8.89301 s, 11.8 MB/s
```

### Speed test from PC to Orange Pi via Ethernet

Start network listener on Orange Pi:

```bash
nc -l 192.168.11.1 12345 >/dev/null
```

Transfer 100 megabytes from PC to Orange Pi:

```shell
$ dd if=/dev/zero bs=1M count=100 | nc 192.168.11.1 12345
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 9.07551 s, 11.6 MB/s
```

In both cases speed pretty close to declared for Ethernet
(11.8 megabyte per second = 94.4 megabit).

## Wi-Fi speed test

![Orange Pi to PC via Wi-Fi](/resources/orange-pi-zero-network-speed-test/orange_pi-laptop-wifi.png)

Measurement is very similar to previous one for Ethernet.

- Wi-Fi on Orange Pi in 802.11g mode (up to 54 megabit per second).
- Orange Pi acts as Wi-Fi Access Point

### Speed test from Orange Pi to PC via Wi-Fi

Transfer 100 megabytes from Orange Pi to PC:

```shell
$ dd if=/dev/zero bs=1M count=100 | nc 192.168.11.10 12345
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 42.5146 s, 2.5 MB/s
```

### Speed test from PC to Orange Pi via Wi-Fi

Transfer 100 megabytes from PC to Orange Pi:

```shell
$ dd if=/dev/zero bs=1M count=100 | nc 192.168.11.1 12345
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 54.1733 s, 1.9 MB/s
```

Inbound and outbound speeds are differ:

- from Orange Pi: 2.5 megabyte per second = 20 megabit
- to Orange Pi: 1.9 megabyte per second = 15.2 megabit
