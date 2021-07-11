## The Post installation after Base install
**Login to new user created**
**First enablea and start the dhcpcd service**
```sh
sudo systemctl enable --now dhcpcd
```
**Now install some absolute important packages**
```sh
sudo pacman -Sy base-devel git alsa-utils pulseaudio firefox wget nvidia nvidia-settings unzip
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