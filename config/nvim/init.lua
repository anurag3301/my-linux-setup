-- insures lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.neorg_root = os.getenv( 'HOME' ).."/notes"

-- include plugins and their config
require('plugins')
require('plug_config.treesitter')
require('plug_config.autopairs')
require('plug_config.colour')
require('plug_config.toggleTerm')
require('plug_config.presence')
require('plug_config.lualine')
require('plug_config.colorizer')
require('plug_config.toggle_lsp_diagnostics')
require('plug_config.lsp_config.lsp-cmp')
require('plug_config.lsp_config.lsp-config')
require('plug_config.lsp_config.mason')
require('plug_config.lsp_config.lsp-signature')
require('plug_config.lsp_config.goto-preview')
require('plug_config.lazygit')
require('plug_config.comment')
require('plug_config.bufferline')
require('plug_config.hop')
require('plug_config.gitsigns')
require('plug_config.autosave')
require('plug_config.startup')
require('plug_config.nvim-tree')
require('plug_config.telescope')
require('plug_config.illuminate')
require('plug_config.dap')
require('plug_config.neorg')
require('pretty-fold').setup()

require('general')
require('functions')
require('bindings')
require('commands')
require('runner')


-- CpHelper config
vim.g["cph#dir"] = os.getenv( 'HOME' )..'/problems'
vim.cmd("autocmd FileType Results setlocal foldlevel=5")
-- Rooter config
vim.g.rooter_pattern = { 'input1', 'output1' }

-- Emmet configuration
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ''
vim.g.maplocalleader = ' '
vim.g.user_emmet_leader_key=','

