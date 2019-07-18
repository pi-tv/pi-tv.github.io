---
layout: post
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

## Remove unwanted locales

```bash
#!/bin/bash

TARGET=/usr/share/locale

echo Cleanup target: $TARGET
echo Disk usage before: `du -sh $TARGET`
find $TARGET/* ! -path "$TARGET/en*" ! -path "$TARGET/locale.alias" -delete
find $TARGET/en_* ! -path "$TARGET/en_US*" -delete
echo Disk usage after: `du -sh $TARGET`
```

Result:
```text
Cleanup target: /usr/share/locale
Disk usage before: 28M /usr/share/locale
Disk usage after: 160K /usr/share/locale
```

## Remove unwanted mans

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

Result:
```text
Cleanup target: /usr/share/man
Disk usage before: 18M /usr/share/man
Disk usage after: 12M /usr/share/man
Update man db
```

## Remove docs

```bash
#!/bin/bash

echo Cleanup docs

echo Disk usage before: `du -sh /usr/share`
rm -rf /usr/share/doc
rm -rf /usr/share/info
echo Disk usage after: `du -sh /usr/share`
```

Result:
```text
Cleanup docs
Disk usage before: 200M /usr/share
Disk usage after: 174M /usr/share
```