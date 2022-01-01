#!/bin/sh

command="curl -s -F'file=@$(pwd)/$1' https://0x0.st"
echo "Executing: $command"

url=$(eval $command)
echo "URL: $url"

printf "$url" | xclip -sel clip
notify-send "File Uploaded" "URL: $url \ncopied to clipboard" -t 5000 -i "$HOME/.program/icon.png"

entry="$(date '+%d-%m-%y-%H:%M:%S')    $url    $(echo $1 | awk -F'/' '{print $(NF)}')"
echo $entry >> $HOME/.0x0_list

