#!/bin/bash

OUTPUT=$( pacmd list-sinks | tail -1)
HDMI="active port: <hdmi-output-0>\n"
OUTPUT=${#OUTPUT}
echo $OUTPUT
if [ $OUTPUT == 29 ]
then
	pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo
else
	pacmd set-card-profile 0 output:hdmi-stereo
fi
	
