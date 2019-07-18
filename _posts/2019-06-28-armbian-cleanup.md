---
layout: post
tags: [Armbian]
permalink: /:title
---

# Armbian cleanup

## Disable auto-updates
### Remove "Unattended Upgrades" package

"Unattended Upgrades" keeps the Armbian up to date with the latest updates automatically.

Sometimes "unattended-upgrade" process eat almost 100% CPU on my Orange Pi.

Do you really need it? I'm not.

This command removes auto-updates service:
```bash
apt remove unattended-upgrades
```

## Cleanup file system

It make sense to cleanup file system if you have limited amount of disk space.
For example, if you use Micro-SDs size of 1GB or 2GB. Or if a board has small EMMC storage.

### Remove unwanted locales

I don't need anything other than English locale.

This script cleans up "locales" directory:
```bash
#!/bin/bash

TARGET=/usr/share/locale

echo Cleanup target: $TARGET
echo Disk usage before: `du -sh $TARGET`
find $TARGET/* ! -path "$TARGET/en*" ! -path "$TARGET/locale.alias" -delete
find $TARGET/en_* ! -path "$TARGET/en_US*" -delete
echo Disk usage after: `du -sh $TARGET`
```

As result, it saves about 28 MegaBytes of disk space:
```text
Cleanup target: /usr/share/locale
Disk usage before: 28M /usr/share/locale
Disk usage after: 160K /usr/share/locale
```

### Remove unwanted mans

I don't need mans in national languages:
```bash
#!/bin/bash

TARGET=/usr/share/man

echo Cleanup target: $TARGET
echo Disk usage before: `du -sh $TARGET`
find $TARGET/* ! -path "$TARGET/man*" -delete
echo Disk usage after: `du -sh $TARGET`

echo Update man db
mandb
```

Is saves 6 MegaBytes:
```text
Cleanup target: /usr/share/man
Disk usage before: 18M /usr/share/man
Disk usage after: 12M /usr/share/man
Update man db
```

### Remove docs

And I don't need any documentation in a language other than English:
```bash
#!/bin/bash

echo Cleanup docs

echo Disk usage before: `du -sh /usr/share`
rm -rf /usr/share/doc
rm -rf /usr/share/info
echo Disk usage after: `du -sh /usr/share`
```

It frees about 25 MegaBytes:
```text
Cleanup docs
Disk usage before: 200M /usr/share
Disk usage after: 174M /usr/share
```
