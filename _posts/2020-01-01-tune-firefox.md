---
title: Firefox tune
tags: [Firefox, Windows]
desc: Tune Firefox
date: 2021-02-21
---

# Firefox
## Disable auto-updates

Just create "C:\Program Files\Mozilla Firefox\distribution\policies.json" file with this content:
```json
{
  "policies": {
    "DisableAppUpdate": true
  }
}
```

