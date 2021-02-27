---
title: Disable auto update in Firefox
tags: [Firefox, Windows]
desc: Turn off auto updates in Firefox
---

# Disable auto update in Firefox

Just create "C:\Program Files\Mozilla Firefox\distribution\policies.json" file with this content:
```json
{
  "policies": {
    "DisableAppUpdate": true
  }
}
```
