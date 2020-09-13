# SnapCraft:
      sudo dnf install snapd
      sudo ln -s /var/lib/snapd/snap /snap
      
# Flatpak:
      sudo dnf install -y flatpak
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Spotify:
      sudo dnf install lpf-spotify-client
      lpf update
                        
      sudo flatpak install flathub com.spotify.Client
      
# Chrome: 
      sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# VLC:
      sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
      sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
      dnf install vlc

# Kite:
      bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
      
# Skype:
      sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
      sudo dnf install skypeforlinux
      
      sudo flatpak install -y --from https://flathub.org/repo/appstream/com.skype.Client.flatpakref
      
# Telegram:
      sudo snap install telegram-desktop
      
      https://desktop.telegram.org/
