---
title: Windows network
tags: [Network, Samba, Windows]
date: 2021-02-21
---

# Windows network

## Samba

### Allow unauthenticated guest access to Samba share

- Run `gpedit.msc`
- Then go to `Comp -> Administrative Templates -> Network -> Lanman Workstation`
- Set `Enable insecure guest logons = Enabled`

### Mount/unmount Samba share

- Mount share: `net use S: "\\myServerName\myShare" /user:myDomain\myUsername myPassword`
- Unmount: `net use S: /delete`
