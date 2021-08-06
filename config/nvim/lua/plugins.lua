return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- apperative plugins
  use 'hrsh7th/vim-vsnip'
  use 'glepnir/dashboard-nvim'
  use 'marko-cerovac/material.nvim'
  use 'andweeb/presence.nvim'

  -- functional plugins
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'kabouzeid/nvim-lspinstall'
  use 'nvim-treesitter/nvim-treesitter'
  use 'akinsho/nvim-toggleterm.lua'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'terrortylor/nvim-comment'
  use "rafamadriz/friendly-snippets"

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
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'Xuyuanp/nerdtree-git-plugin',
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

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

end)
