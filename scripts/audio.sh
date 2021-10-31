#!/bin/sh

#devices
speakers="alsa_output.pci-0000_05_00.1.hdmi-stereo"
headphone="alsa_output.pci-0000_07_00.4.analog-stereo"

curr_device="$(pactl get-default-sink)"

if [ "$curr_device" = $speakers ]
then
  pactl set-default-sink $headphone
else
  pactl set-default-sink $speakers
fi 
