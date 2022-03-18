#!/bin/sh

id="$(xsetwacom list devices | grep stylus | awk '{print $9}')"

if [ "$1" == "l" ] 
then
    xsetwacom set $id MapToOutput 2560x1440+0+0

elif [ "$1" == "r" ] 
then
    xsetwacom set $id MapToOutput 1366x768+1366+0

else
    echo "Invalid input"
fi

