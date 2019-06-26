---
layout: default
tags: Armbian, Orange Pi, HDMI, Framebuffer
permalink: /:title

---

# Orange Pi HDMI framebuffer mode

My Orange Pi PC 2 (Armbian 5.83) always outputs video to a HDMI TV using the **1920x1080@60** mode. 
Loader gets this resolution from the TV itself.

But this resolution isn't comfortable to work in the console.
Characters are extremely small.
And it would be nice to have them, for example, twice bigger, because eyes just get very tired.
 
 
It can be changed. Just add this line:

```text
extraargs=drm_kms_helper.edid_firmware=HDMI-A-1:edid/1280x720.bin video=HDMI-A-1:1280x720@60
```

into the `/boot/armbianEnv.txt` and reboot.
