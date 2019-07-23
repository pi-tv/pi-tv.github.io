#!/bin/bash

TARGET=/usr/share/locale

echo Cleanup target: $TARGET
echo Disk usage before: `du -sh $TARGET`
find $TARGET/* ! -path "$TARGET/en*" ! -path "$TARGET/locale.alias" -delete
find $TARGET/en_* ! -path "$TARGET/en_US*" -delete
echo Disk usage after: `du -sh $TARGET`
