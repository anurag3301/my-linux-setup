# Chrome: 
      sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# VLC:
      sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
      sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
      dnf install vlc

# Kite:
      bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
