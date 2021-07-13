---
title: Arch Linux setup Firefox
tags: [Arch Linux, Linux, GUI, Firefox]
desc: Firefox tune in Linux
date: 2021-07-13
---

# Arch Linux setup Firefox
## Install Firefox
`pacman -Sy firefox`

## Turn off unwanted features in Firefox

Create /usr/lib/firefox/distribution/policies.json
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


## Use tor
Install tor `pacman -Sy tor`
Start tor:
```bash
systemctl start tor
systemctl status tor
sudo netstat -ltnp | grep tor
```

### Firefox proxy
Goto `Settings - > Proxy -> Manual proxy configuration`

- SOCKS Host: 127.0.0.1
- Proxy DNS when using SOCKS v5
- Port: 9050

Check it in browser: `https://check.torproject.org/`
