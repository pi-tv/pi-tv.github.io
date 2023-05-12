---
title: Firefox
tags: [Debloat, Firefox, GUI, Proxy, Tor]
date: 2021-07-13
---

# Firefox

## Install Firefox

`pacman -Sy firefox`

## Turn off unwanted features in Firefox

Create "/usr/lib/firefox/distribution/policies.json"

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

- CaptivePortal - disable detection of captive portals.
- DisableAppUpdate - turn off Firefox updates.
- DisableFeedbackCommands - disable Submit Feedback.
- DisableFirefoxAccounts - disable Firefox Accounts integration.
- DisableFirefoxStudies - disallow Firefox to install and run studies.
- DisableTelemetry - prevent the upload of telemetry data.
- SearchEngines.PreventInstalls - prevent installing search engines.

Full list of options is available
[here](https://github.com/mozilla/policy-templates/blob/master/windows/en-US/firefox.adml).

Create "/usr/lib/firefox/defaults/pref/prefs.js"

```js
pref("app.shield.optoutstudies.enabled", false)
pref("browser.ping-centre.telemetry", false);
pref("browser.shell.checkDefaultBrowser", false);
pref("browser.urlbar.placeholderName", "Google");
pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
pref("browser.newtabpage.activity-stream.feeds.snippets", false);
pref("browser.newtabpage.activity-stream.feeds.topsites", false);
pref("browser.newtabpage.activity-stream.showSearch", false);
pref("browser.newtabpage.activity-stream.telemetry", false);
pref("dom.webnotifications.enabled", false);
pref("dom.battery.enabled", false);
pref("experiments.activeExperiment", false);
pref("geo.enabled", false);
pref("toolkit.telemetry.enabled", false);
```

## Use Tor

Install Tor `pacman -Sy tor`
Start Tor:

```bash
systemctl start tor
systemctl status tor
sudo netstat -ltnp | grep tor
```

### Firefox Tor proxy

Goto `Settings - > Proxy -> Manual proxy configuration`

- SOCKS Host: 127.0.0.1
- Proxy DNS when using SOCKS v5
- Port: 9050

Or add into the "/usr/lib/firefox/defaults/pref/prefs.js"

```js
pref("network.proxy.socks", "127.0.0.1");
pref("network.proxy.socks_port", 9050);
pref("network.proxy.socks_remote_dns", true);
pref("network.proxy.type", 1);
```

Check it in browser at "https://check.torproject.org/"
