# DNF Package:
      sudo dnf install gnome-tweak-tool ranger neofetch ccrypt g++ node npm bpython vlc

# SnapCraft:
      sudo dnf install snapd
      sudo ln -s /var/lib/snapd/snap /snap

# Snap Package:
      snap install spotify telegram-desktop
      
# Flatpak:
      sudo dnf install -y flatpak
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      
# Chrome: 
      sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Kite:
      bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
      
# Skype:
      sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
      sudo dnf install skypeforlinux
      
      sudo flatpak install -y --from https://flathub.org/repo/appstream/com.skype.Client.flatpakref
      
