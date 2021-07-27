return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use {'p00f/cphelper.nvim', rocks = 'http', requires = 'nvim-lua/plenary.nvim'}
  use {'kaicataldo/material.vim', 
    config = function ()
      vim.cmd([[
        let g:material_terminal_italics = 1
        let g:material_theme_style = 'lighter'
        colorscheme material
        if (has('termguicolors'))
          set termguicolors
        endif
      ]])
    end}
  
  use {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)