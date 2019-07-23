#!/bin/bash

TARGET=/usr/share/man

echo Cleanup target: $TARGET
echo Disk usage before: `du -sh $TARGET`
find $TARGET/* ! -path "$TARGET/man*" -delete
echo Disk usage after: `du -sh $TARGET`

echo Update man db
mandb
