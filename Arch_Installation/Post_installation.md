## The Post installation after Base install
**Login to new user created**

**First enable and start the NetworkManager service**
```sh
sudo systemctl enable --now NetworkManager.service 
```

**Use nmcli to connect to wifi**
```sh
nmcli radio wifi on
nmcli d wifi list
nmcli d wifi connect {SSID} password {password}
```

**Clone my-linux-setup repo, my build of dwm, paru**
```sh
# Cloning my linux-setup.git
git clone https://github.com/anurag3301/my-linux-setup.git

# Cloning my build of dwm
git clone https://github.com/anurag3301/my-dwm.git

# Cloning paru
git clone https://aur.archlinux.org/paru.git
```

**Install the required packages**
```sh 
sh my-linux-setup/scripts/package_install.sh
```

**Lets build and install dwm and paru**
```sh
# Install dwm
cd my-dwm
sudo make clean install

# Install paru
cd paru
makepkg -si
```

**Start the pulse audio service**
```sh
systemctl --user enable pulseaudio
```

**Install the aur packages**
```sh
```

**Install nerd fornt**
```sh
sudo mkdir /usr/local/share/fonts
sudo mkdir /usr/local/share/fonts/ttf
cd /usr/local/share/fonts/ttf
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip
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

**OPTIONAL: Setup autologin**
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
