#!/bin/bash

if [ -d ~/.program ]; then
    echo "~/.program directory exits, cd into it"
    cd ~/.program
else
    echo "~/.program directory does not exits, creating the directory and cd into it"
    mkdir ~/.program
    cd ~/.program
fi

mkdir kdenlive
cd kdenlive

# Get the link for latest version of kdenlive from this link https://download.kde.org/stable/kdenlive/
# And change the below variable

URL=https://download.kde.org/stable/kdenlive/20.12/linux/kdenlive-20.12.3a-x86_64.appimage

wget -O kdenlive.appimage "$URL"
wait
chmod +x kdenlive.appimage
wget https://raw.githubusercontent.com/anurag3301/my-linux-stuff/master/other/kdenlive.png

cd ~/.local/share/applications
echo "[Desktop Entry]
Name=Kdenlive
Exec=$HOME/.program/kdenlive/kdenlive.appimage
Icon=$HOME/.program//kdenlive/kdenlive.png
Terminal=false
Type=Application
Categories=Media;
X-GNOME-UsesNotifications=true
" >> kdenlive.desktop
