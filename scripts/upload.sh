#!/bin/zsh

if [[ "$1" == "-u" ]]
then
    if [[ ${#2} > 0 ]]
    then
        if [[ -f "$(pwd)/$2" ]]
        then
            command="curl -s -F'file=@$(pwd)/$2' https://0x0.st"
            echo "Executing: $command"

            url=$(eval $command)
            echo "URL: $url"

            printf "$url" | xclip -sel clip
            notify-send "File Uploaded" "URL: $url \ncopied to clipboard" -t 5000 -i "$HOME/.program/icon.png"

            entry="$(date '+%d-%m-%y-%H:%M:%S')    $url    $(echo $2 | awk -F'/' '{print $(NF)}')"
            echo $entry >> $HOME/.0x0_list
            echo "Uploaded"
        else
            echo "File doesnt exist"
        fi
    else
        echo "Please give a file name"
    fi

elif [[ "$1" == "-l" ]]
then
    if [[ ${#2} > 0 ]]
    then
        if [[ $2 =~ ^[0-9]+$ ]]
        then
            cat ~/.0x0_list | tail -$2
        else
            echo "Enter a valid integer"
        fi
    else
        cat ~/.0x0_list | less
    fi

elif [[ "$1" == "-e" ]]
then
    nvim ~/.0x0_list
else
    echo "Invalid argument"
fi    
