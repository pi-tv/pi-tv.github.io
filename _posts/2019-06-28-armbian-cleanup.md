---
layout: default
tags: [Armbian]
permalink: /:title

---
# Armbian cleanup

## Remove "Unattended Upgrades" package
Unattended Upgrades keeps Armbian up to date with the latest updates automatically.

Sometimes "unattended-upgrade" process eat almost 100% CPU on my Orange Pi.

Do you really need it? I'm not.

This command helps a lot:

```bash
apt remove unattended-upgrades
```
