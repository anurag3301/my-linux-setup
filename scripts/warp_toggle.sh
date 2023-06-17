#!/bin/bash

warp_status="$(timeout 1 warp-cli status | head -1 | awk '{print $3}' 2> /dev/null)"

if [ "$warp_status" == "Connected" ]; then
    warp-cli disconnect
elif [ "$warp_status" == "Disconnected." ]; then
    warp-cli connect
else
    warp-cli connect
fi
