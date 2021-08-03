return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'p00f/cphelper.nvim', rocks = 'http', requires = 'nvim-lua/plenary.nvim'}
  use 'windwp/nvim-autopairs'
  use 'ygm2/rooter.nvim'
  use {'akinsho/nvim-toggleterm.lua'}
  use {
    'marko-cerovac/material.nvim',
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  use {
    'nvim-treesitter/nvim-treesitter',
  }

  use {
    'preservim/nerdtree',
    requires = {
      'ryanoasis/vim-devicons',
      'tiagofumo/vim-nerdtree-syntax-highlight',
      opt = true}
  }

  use 'andweeb/presence.nvim'
  use 'glepnir/dashboard-nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/vim-vsnip'
--[[  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  ]]
end)
