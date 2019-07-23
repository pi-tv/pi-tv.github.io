#!/bin/bash

BURN=70
WARN=60
HEAT=50
COLD=0

temp=$(</sys/devices/virtual/thermal/thermal_zone0/temp)

if [ "$temp" -gt 300 ]
then
    temp=$(($temp/1000))
fi

echo -n "CPU temperature: "
if [ "$temp" -ge "$BURN" ]
then
    echo -e "\e[91m\e[41m$temp°C\e[0m"
elif [ "$temp" -ge "$WARN" ]
then
    echo -e "\e[91m$temp°C\e[0m"
elif [ "$temp" -ge "$HEAT" ]
then
    echo -e "\e[93m$temp°C\e[0m"
elif [ "$temp" -le "$COLD" ]
then
    echo -e "\e[94m$temp°C\e[0m"
else
    echo -e "\e[92m$temp°C\e[0m"
fi
