# DNF Package:
      sudo dnf install gnome-tweak-tool ranger neofetch ccrypt g++ node npm bpython filezilla vim vim-X11 bat

# SnapCraft:
      sudo dnf install snapd
      sudo ln -s /var/lib/snapd/snap /snap

# Snap Package:
      snap install spotify telegram-desktop
      
# Chrome: 
      sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
      
# Sublime Text: 
      sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
      sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
      sudo dnf install sublime-text
    
# Kite:
      bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
      
# Skype:
      sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
      sudo dnf install skypeforlinux
      
      sudo flatpak install -y --from https://flathub.org/repo/appstream/com.skype.Client.flatpakref
      
