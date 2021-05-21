# APT Package:
      sudo apt install gnome-tweak-tool ranger neofetch ccrypt g++ htop nodejs npm bpython filezilla vim vim-gtk bat clang openvpn dialog python3-pip python3-setuptools simplescreenrecorder python3-deve obs-studio gimp

# SnapCraft:
      sudo dnf install snapd
      sudo ln -s /var/lib/snapd/snap /snap

# Snap Package:
      snap install spotify telegram-desktop vlc

# NVIDIA CUDA Toolkit and cuDNN library:
      sudo apt install system76-cuda-latest
      sudo apt install system76-cudnn-10.2
      `Visit https://support.system76.com/articles/cuda/`

# Chrome: 
      wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
      sudo dpkg -i google-chrome-stable_current_amd64.deb
      rm google-chrome-stable_current_amd64.deb

# Sublime Text: 
      sudo apt install apt-transport-https ca-certificates curl software-properties-common
      curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
      sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
      sudo apt update
      sudo apt install sublime-text

# ProtonVPN:
      sudo pip3 install protonvpn-cli
      protonvpn init

# Kite:
      bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"

# Skype:
      wget https://go.skype.com/skypeforlinux-64.deb
      sudo dpkg -i ./skypeforlinux-64.deb
      rm skypeforlinux-64.deb
