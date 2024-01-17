#!/bin/bash

#get the current date
currentDate=$(/bin/date +%s)

#get the last boot date
bootDate=$(/usr/sbin/sysctl -n kern.boottime | /usr/bin/awk -F'[ ,]' '{print $4}')

#how many seconds in 7 days
week=604800

#echo $currentDate
#echo $bootDate
#echo $week

#get current uptime by subtracting the bootDate from the currentDate; result will be returned in seconds.
uptime=$(( currentDate - bootDate ))

#echo $uptime
if [ $uptime -ge $week ]; then
    echo "Machine Needs to be rebooted"
else 
    echo "Machine is fine"
fi
