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

require('lsp')

require('nerdtree')

-- include presence and its config
require("presence"):setup({
    enable_line_number = true,
    main_image = "file",
    neovim_image_text = "The gods editor",
    debounce_timeout = 10,
})

require('treesitter')

-- include lualine and its config
require('lualine').setup{
	  options = {
      theme = 'material-nvim'
  }
}

require('autopairs')

-- include toggleterm
require("toggleterm").setup{
  size = 15,
  open_mapping = '<F1>',
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell, -- change the default shell
}


-- CpHelper config
vim.g.cphdir = '/home/anurag/problems'

-- Rooter config
vim.g.rooter_pattern = { "input1", "output1" }

require("colors")

require("dashboard")

require("general")
