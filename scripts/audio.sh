#!/bin/zsh

var=$(pacmd list-sinks | grep -e 'index:' | awk '{print $1}' | head -n 1)

if [ "$var" = "*" ]
then
    echo "Its Headphone, changing to speakers"
    pacmd "set-default-sink alsa_output.pci-0000_05_00.1.hdmi-stereo"
else
    echo "Its speakers, changing to Headphone"
    pacmd "set-default-sink alsa_output.pci-0000_07_00.4.analog-stereo"
fi

