---
title: Disable auto update in Firefox
tags: [Firefox, Windows, Linux, MyDeviceMyRules]
desc: Turn off auto updates in Firefox
---

# Disable auto update in Firefox

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
- [Debloat Firefox](/debloat-firefox)