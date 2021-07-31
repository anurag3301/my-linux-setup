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

-- lsp-config keybindigs
vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd("nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>")
vim.cmd("nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.cmd("nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
vim.cmd("nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require'lspconfig'.pyright.setup{}



-- include presence and its config
require("presence"):setup({
    enable_line_number = true,
    main_image = "file",
    neovim_image_text = "The gods editor",
    debounce_timeout = 10,
})

-- include treesitter and its config
require("nvim-treesitter.configs").setup{
  ensure_installed = {"c", "cpp"},
  highlight = {
    enable = true,
    disable = {},
  },
}

-- Nerd tree config
vim.g.NERDTreeFileExtensionHighlightFullName = 1
vim.g.NERDTreeExactMatchHighlightFullName = 1
vim.g.NERDTreePatternMatchHighlightFullName = 1
vim.api.nvim_set_keymap('n', '<F7>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })


-- include lualine and its config
require('lualine').setup{
	  options = {
      theme = 'material-nvim'
  }
}

-- include nvim-autopairs
require('nvim-autopairs').setup()

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

-- Material Theme config
vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = true
vim.g.material_contrast = true
vim.g.material_borders = true
vim.g.material_disable_background = false
require('material').set()
vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })

-- include autosave and its config
local autosave = require("autosave")
autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave"},
        conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)

-- Dashboard config
vim.g.dashboard_custom_header = {
    "                                                              ",
    "    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ",
    " ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ",
    " ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ",
    "   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ",
    "      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ",
    "        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ",
    "             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ",
    "             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ",
    "             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ",
    "                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ",
    "                            ⠘⣷⠁                               ",
    "                             ⠙⣤                               ",
    "                              ⠛⠂                              ",
    "                                                              "
}
vim.cmd([[highlight DashboardHeader guifg=#ffffff]])


-- General config
vim.opt['number'] = true
vim.opt['ruler'] = true
vim.opt['splitright'] = true
vim.opt['splitbelow'] = true
vim.opt['smarttab'] = true
vim.opt['expandtab'] = true
vim.opt['smartindent'] = true
vim.opt['autoindent'] = true
vim.opt['tabstop'] = 2
vim.opt['shiftwidth'] = 2
vim.opt['autoread'] = true
vim.opt['title'] = true
vim.opt['termguicolors'] = true
vim.opt['hlsearch'] = true
vim.opt['hidden'] = true
vim.opt['encoding'] = 'utf-8'
vim.opt['fileencoding'] = 'utf-8'
vim.opt['showmode'] = false
vim.opt['clipboard'] = 'unnamedplus'
vim.opt['swapfile'] = false

-- Persistent undo
-- mkdir $HOME/.vim/undo
vim.opt['undofile'] = true
vim.opt['undodir'] = '/home/anurag/.cache/nvim/undo'
vim.opt['undolevels'] = 1000
vim.opt['undoreload'] = 10000

-- Stop comments on newline
vim.cmd([[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Auto remove trailing space
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- Disable lualine on Nvim-tree
vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]

