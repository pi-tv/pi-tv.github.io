---
title: Firefox disable auto update
tags: [Firefox, Windows, Linux, MyDeviceMyRules]
desc: Turn off auto updates in Firefox
date: 2021-02-21
---

# Firefox disable auto update

Just create a "policies.json" file located at:
- For Windows: "C:\Program Files\Mozilla Firefox\distribution"
- For Linux: "/usr/lib/firefox/distribution"
with this content:

```json
{
    "policies": {
        "DisableAppUpdate": true
    }
}
```

Then restart Firefox. This disables Firefox updates.

## Related links
- [Firefox debloat](/firefox-debloat)