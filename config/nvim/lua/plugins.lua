return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'windwp/nvim-autopairs'
  use 'glepnir/dashboard-nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'akinsho/nvim-toggleterm.lua'
  use 'marko-cerovac/material.nvim'

  use {
    'p00f/cphelper.nvim',
    rocks = 'http',
    requires = {
      'nvim-lua/plenary.nvim',
      'ygm2/rooter.nvim',
      opt = true
    }
  }

  use {
    'andweeb/presence.nvim',
    require = {
      'hrsh7th/vim-vsnip',
      opt = true
    }
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  use {
    'preservim/nerdtree',
    requires = {
      'ryanoasis/vim-devicons',
      'tiagofumo/vim-nerdtree-syntax-highlight',
      opt = true}
  }

  use {'neovim/nvim-lspconfig',
    require = {
      'hrsh7th/nvim-compe',
      'kabouzeid/nvim-lspinstall',
      opt = true
    }
  }
--[[  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  ]]
end)
