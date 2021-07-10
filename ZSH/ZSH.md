# ZSH Installation and configuration
```sh
sudo pacman -S zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
      
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

wget https://raw.githubusercontent.com/anurag3301/my-linux-setup/main/ZSH/zshrc; cat zshrc > ~/.zshrc; rm zshrc;
```