#!/bin/bash

if [ -d ~/.program ]; then
    echo "~/.program directory exits, cd into it"
    cd ~/.program
else
    echo "~/.program directory does not exits, creating the directory and cd into it"
    mkdir ~/.program
    cd ~/.program
fi

wget -O discord.gz https://discord.com/api/download\?platform\=linux\&format\=tar.gz
wait
tar xvf discord.gz
wait
rm discord.gz
wait
cd ~/.local/share/applications

echo "[Desktop Entry]
Name=Discord
Exec=$HOME/.program/Discord/Discord
Icon=$HOME/.program/Discord/discord.png
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
X-GNOME-UsesNotifications=true
" >> discord.desktop

