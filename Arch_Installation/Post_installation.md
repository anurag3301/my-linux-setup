## The Post installation after Base install
**Login to new user created**

**First enable and start the dhcpcd service**
```sh
sudo systemctl enable --now dhcpcd
```
**Now install some absolute important packages**
```sh
sudo pacman -Sy base-devel git firefox wget nvidia nvidia-settings unzip
```
**Install some display and audio packages**
```sh
# Install the packages
sudo pacman -Sy alsa-utils pulseaudio xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk

# Start the pulse audio service
systemctl --user enable pulseaudio
```
**Clone my-linux-setup repo, my build of dwm, paru**
```sh
# Cloning my linux-setup.git
https://github.com/anurag3301/my-linux-setup.git

# Cloning my build of dwm
https://github.com/anurag3301/my-dwm.git

# Cloning paru
git clone https://aur.archlinux.org/paru.git
```
**Lets build and install dwm and paru**
```sh
# Install dwm
cd dwm
sudo make clean install

# Install paru
cd paru
makepkg -si
```
**Install the rest of the pacman and aur packages**
```sh
sudo pacman -S bat bpython cmake cmatrix discord dmenu dunst evince exa ffmpeg figlet firefox gcc gimp grep htop imagemagick kitty lolcat maim neofetch nitrogen npm nvtop obs-studio picom playerctl ranger telegram-desktop v4l-utils vlc openssh noto-fonts-emoji python-pillow gnome-boxes spice-vagent

sudo pacman -S python-pip tk xclip xorg-xsetroot neovim lazygit testdisk

sudo pacman -S lxappearance-gtk3

paru -S brave-bin ccrypt spofity visual-studio-code-bin gotop 
```

**Install nerd fornt**
```sh
sudo mkdir /usr/local/share/fonts
sudo mkdir /usr/local/share/fonts/ttf
cd /usr/local/share/fonts/ttf
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache
```

**Set the config files**
```sh
#please cd into my-linux-setup/config
conf_path=$(pwd)
echo $conf_path

for d in *; do
    run="ln -s $conf_path/$d $HOME/.config/$d"
    echo $run
    eval $run
done
```

**Install Nordic GTK theme**
```sh
git clone https://github.com/EliverLara/Nordic.git
sudo cp -r Nordic /usr/share/themes/
lxappearance
```

**Setup autologin**
```sh
sudo nvim /etc/systemd/system/getty.target.wants/getty@tty1.service
```
```diff
diff --git a/getty@tty1.service b/getty@tty1.service
index 381bdb1..46270e5 100644
--- a/getty@tty1.service
+++ b/getty@tty1.service
@@ -35,7 +35,7 @@ ConditionPathExists=/dev/tty0
 # The '-o' option value tells agetty to replace 'login' arguments with an
 # option to preserve environment (-p), followed by '--' for safety, and then
 # the entered username.
-ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear - $TERM
+ExecStart=-/usr/bin/agetty --autologin anurag --noclear %I $TERM
 Type=idle
 Restart=always
 RestartSec=0
```

### Now you can reboot and do the ZSH and VIM config
