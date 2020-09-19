# Installation
      sudo apt install zsh
      sudo dnf install zsh

# Make ZSH Default Shell
      chsh -s $(which zsh)

# Install Oh My ZSH
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      
      Visit: https://github.com/ohmyzsh/ohmyzsh

# Change Theme
      Select any Theme from https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
      
      Edit:      vim ~/.zshrc
      Edit:      ZSH_THEME="ThemeName"
      Default:   ZSH_THEME="robbyrussell"
      
# Install Autosuggestion
      git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
      
      Edit:      vim ~/.zshrc
      Edit:      plugins=(git zsh-autosuggestions)
      Default:   plugins=(git)
