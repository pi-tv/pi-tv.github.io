---
title: Debloat Firefox
tags: [Firefox, Windows, #MyDeviceMyRules]
desc: Turn off unwanted features in Firefox
date: 2021-02-27
---

# Debloat Firefox

Some features in Firefox can be disabled by creating the enterprise policy file.

In Windows the file is expected here: "C:\Program Files\Mozilla Firefox\distribution\policies.json".
For Linux, it is "/usr/lib/firefox/distribution/policies.json".

These options:
```json
{
    "policies": {
        "CaptivePortal": false,
        "DisableAppUpdate": true,
        "DisableFeedbackCommands": true,
        "DisableFirefoxAccounts": true,
        "DisableFirefoxStudies": true,
        "DisableTelemetry": true,
        "SearchEngines": {
            "PreventInstalls": true
        }
    }
}
```

do:
- CaptivePortal - disable detection of captive portals.
- DisableAppUpdate - turn off Firefox updates.
- DisableFeedbackCommands - disable Submit Feedback.
- DisableFirefoxAccounts - disable Firefox Accounts integration.
- DisableFirefoxStudies - disallow Firefox to install and run studies.
- DisableTelemetry - prevent the upload of telemetry data.
- SearchEngines.PreventInstalls - prevent installing search engines.

Full list of options is available 
[here](https://github.com/mozilla/policy-templates/blob/master/windows/en-US/firefox.adml).

## Related links
- [Firefox disable auto update](/firefox-disable-auto-update)