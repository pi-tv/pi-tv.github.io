---
title: Xiaomi portable hotspot turns off after 5 minutes
tags: [Android, Xiaomi, Wi-Fi]
desc: Fix auto stopping of a mobile hotspot in Android.
date: 2021-02-27
---

# Xiaomi portable hotspot turns off after 5 minutes 

Mobile hotspot automatically turns off after some minutes, when a phone is locked.
And laptop, connected through this hotspot disconnects from the internet again and again?

This solved the problem for me and made the hotspot work:

```text
Settings -> 
    Battery & performance ->
        Gear in the top right corner ->
            Turn off mobile data when device is locked = Never
```