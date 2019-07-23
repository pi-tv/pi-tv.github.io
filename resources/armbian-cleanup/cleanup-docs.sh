#!/bin/bash

echo Cleanup docs

echo Disk usage before: `du -sh /usr/share`
rm -rf /usr/share/doc
rm -rf /usr/share/info
echo Disk usage after: `du -sh /usr/share`

