# My NeoVim Config
## Some Screenshots of nvim

## Installation

Required neovim version `NVIM v0.5+`, if your distro's package repository doesn't provide then have a look at this [reddit comment](https://www.reddit.com/r/neovim/comments/f9661m/comment/fipokxi/?utm_source=share&utm_medium=web2x&context=3).

After Installation check the version by running `nvim --version`

Install a nerd font, [check this](https://www.nerdfonts.com/font-downloads). Install any of them.

Create a repos dir in home dir and cd into it
```sh
mkdir ~/repos && cd ~/repos
```

Clone my linux config repo
```sh
git clone https://github.com/anurag3301/my-linux-setup.git
```

Create a symbolic link of my neovim config dir to your ~/.config/nvim
```sh
ln -s $HOME/repos/my-linux-setup/config/nvim $HOME/.config/nvim
```

Open neovim, you should get some errors, just press enter key and run `:PackerInstall` followed by `:PackerSync`. This will install all the plugins.

Install the Required LSP servers

https://github.com/anurag3301/my-linux-setup/blob/4d9e1daf2fe8875517b3cadb874c237b55769d11/config/nvim/lua/plug_config/lsp_config/lsp-config.lua#L1-L7

To get the latest changed you just have to do `cd ~/repos/my-linux-setup && git pull`. This will pull the latest commits and its a symbolic link to `~/.config`, so the changes will reflect there also.

#### Go Through all the configs and understand it and make changes as per your needs.
