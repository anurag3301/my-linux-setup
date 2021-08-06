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
require('plug-config.nerdtree')
require('plug-config.treesitter')
require('plug-config.autopairs')
require("plug-config.colors")
require("plug-config.dashboard")
require("plug-config.toggleTerm")
require("plug-config.presence")
require("plug-config.lualine")
require("plug-config.colorizer")
require("plug-config.toggle_lsp_diagnostics")
require('plug-config.lsp')
require('plug-config.lazygit')
require('plug-config.comment')
require('plug-config.bufferline')
require('plug-config.hop')

require("general")
require("bindings")


-- CpHelper config
vim.g.cphdir = '/home/anurag/problems'

-- Rooter config
vim.g.rooter_pattern = { "input1", "output1" }

