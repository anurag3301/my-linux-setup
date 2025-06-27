#!/bin/bash
set -e

# echo "==> Install zsh"
# sudo pacman -S zsh

echo "==> Setting up symlinks..."
ln -sf "$(pwd)/zshrc" "$HOME/.zshrc"
ln -sf "$(pwd)/aliases" "$HOME/.aliases"
ln -sf "$(pwd)/base" "$HOME/.base"
ln -sf "$(pwd)/pathlist" "$HOME/.pathlist"

echo "==> Installing Oh My Zsh..."
export RUNZSH=no  # Prevent auto-launch
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "==> Install zsh-autosugession"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "==> Install zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "==> Install p10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "==> Setup completed!!!"
