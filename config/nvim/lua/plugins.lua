return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use {'p00f/cphelper.nvim', rocks = 'http', requires = 'nvim-lua/plenary.nvim'}
  use 'marko-cerovac/material.nvim'
  use {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)