---
title: Orange Pi HDMI framebuffer mode
tags: [Armbian, Framebuffer, HDMI, Linux, Orange Pi]
desc: Configure Orange Pi framebuffer resolution.
date: 2019-07-25
---

# Orange Pi HDMI framebuffer mode

My Orange Pi PC 2 (Armbian 5.83 with a mainline kernel) always outputs video to HDMI TV using the **1920x1080@60** mode. 
Loader gets this resolution from the TV itself.

This resolution isn't comfortable to work in the console because characters are very small.
It would be nice to have them, for example, twice bigger, because eyes just get very tired.
 
It can be changed by putting this line:

```text
extraargs=drm_kms_helper.edid_firmware=HDMI-A-1:edid/1280x720.bin video=HDMI-A-1:1280x720@60
```

into the "/boot/armbianEnv.txt". Then save and reboot.
