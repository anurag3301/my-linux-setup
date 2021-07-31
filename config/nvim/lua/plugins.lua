return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
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
  use 'Pocco81/AutoSave.nvim'
  use 'glepnir/dashboard-nvim'

end)
