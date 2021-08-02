-- insures packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- include plugins and their config
require('plugins')
require('lsp')
require('nerdtree')
require('treesitter')
require('autopairs')
require("colors")
require("dashboard")
require("general")
require("toggleTerm")

-- include presence and its config
require("presence"):setup({
    enable_line_number = true,
    main_image = "file",
    neovim_image_text = "The gods editor",
    debounce_timeout = 10,
})

-- include lualine and its config
require('lualine').setup{
	  options = {
      theme = 'material-nvim'
  }
}

-- CpHelper config
vim.g.cphdir = '/home/anurag/problems'

-- Rooter config
vim.g.rooter_pattern = { "input1", "output1" }

