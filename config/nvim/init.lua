-- insures packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- include plugins
require('plugins')
require('lualine').setup{
	  options = {
      -- ... your lualine config
      theme = 'material-nvim'
      -- ... your lualine config
  }
}

-- CpHelper config
vim.g.cphdir = '/home/anurag/problems'


vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = true
vim.g.material_contrast = false
vim.g.material_borders = false
vim.g.material_disable_background = false
require('material').set()
vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })

require('nvim-autopairs').setup()

require("toggleterm").setup{}
