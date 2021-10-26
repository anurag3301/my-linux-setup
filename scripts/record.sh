#!/usr/bin/env bash
ARG=${1?Error: no input given}

case "$ARG" in 
  "d")
    echo "Recording Desktop audio" &
    ffmpeg -y -f pulse -i $(pactl get-default-sink).monitor\
      "$HOME/vid/desktop_$(date '+%d-%m-%y-%H:%M:%S').wav";;

  "m")
    echo "Recording Mircrophone audio" &
    ffmpeg -y -f pulse -i alsa_input.usb-DCMT_Technology_USB_Condenser_Microphone_214b206000000178-00.mono-fallback\
      "$HOME/vid/mictrophone_$(date '+%d-%m-%y-%H:%M:%S').wav";;

  "s1") 
    echo "Recording with screen 1" & 
    ffmpeg -y -f x11grab -r 25 -s $(xrandr | fgrep '*' | awk '{print $1}')\
      -i :0.0 -vcodec libx264 -preset ultrafast\
      "$HOME/vid/record_$(date '+%d-%m-%y-%H:%M:%S').mkv";;
  
  "s2") echo "Recording with screen 2" ;;

  "s1m") echo "Recording with screen 1 and microphone" &
    ffmpeg -y -f pulse -i alsa_input.usb-DCMT_Technology_USB_Condenser_Microphone_214b206000000178-00.mono-fallback\
      -f x11grab -r 25 -s $(xrandr | fgrep '*' | awk '{print $1}')\
      -i :0.0 -vcodec libx264 -preset ultrafast\
      "$HOME/vid/record_$(date '+%d-%m-%y-%H:%M:%S').mkv";;

  "s2m") echo "Recording with screen 2 and microphone" ;;

  "s1d") echo "Recording with screen 1 and desktop audio" &
    ffmpeg -y -f pulse -i $(pactl get-default-sink).monitor\
      -f x11grab -r 25 -s $(xrandr | fgrep '*' | awk '{print $1}')\
      -i :0.0 -vcodec libx264 -preset ultrafast\
      "$HOME/vid/record_$(date '+%d-%m-%y-%H:%M:%S').mkv";;
  
  "s2d") echo "Recording with screen 2 and desktop audio" ;;

  "s1dm") echo "Recording with screen 1 and both microphone and desktop audio" &
    ffmpeg -f x11grab -r 25 -s $(xrandr | fgrep '*' | awk '{print $1}') -i :0.0 \
      -vcodec libx264 -preset ultrafast\
      -f pulse -i $(pactl get-default-sink).monitor -f pulse -i\
      alsa_input.usb-DCMT_Technology_USB_Condenser_Microphone_214b206000000178-00.mono-fallback\
      -filter_complex "[0][1] amix [a]" -map "[a]" -threads 2\
      "$HOME/vid/record_$(date '+%d-%m-%y-%H:%M:%S').mkv";;
  
  "s2dm") echo "Recording with screen 2 and both microphone and desktop audio" ;;
esac

