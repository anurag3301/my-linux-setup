map = vim.api.nvim_set_keymap

-- LSP bindings: nivm/lua/plug_config/lsp_config/lsp-config.lua

    
function _find_files()
    local is_git = os.execute("git status &>/dev/null")
    if (is_git == 0) then
        vim.cmd(":Telescope git_files")
    else
        vim.cmd(":Telescope find_files")
    end
end


map('n', '<Leader>n', ':enew<CR>', { noremap = true, silent = true })
map('n', '<Leader>f', ':lua _find_files()<CR>', { noremap = true, silent = true })
map('n', '<Leader>o', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
map('n', '<Leader>s', ':Telescope live_grep<CR>', { noremap = true, silent = true })
map('n', '<Leader>[', ':vertical resize +7<CR>', { noremap = true, silent = true })
map('n', '<Leader>]', ':vertical resize -7<CR>', { noremap = true, silent = true })
map('n', '<Leader>cc', ':ColorizerToggle<CR>', { noremap = true, silent = true })
map('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
map('n', '<Leader>b', ':Bracey<CR>', { noremap = true, silent = true })
map('n', '<Leader>bb', ':BraceyStop<CR>', { noremap = true, silent = true })
map('n', '<Leader>bbb', ':BraceyReload<CR>', { noremap = true, silent = true })

map('n', 'f', ':BufferLinePick<CR>', { noremap = true, silent = true })
map('n', 'F', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
map('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
map('n', 'm.', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
map('n', 'm,', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })

map('n', ';j', ':HopWord<CR>', { noremap = true, silent = true })
map('n', ';l', ':HopLineStart<CR>', { noremap = true, silent = true })

map('n', '<Leader>dd', ':ToggleDiag<CR>', { noremap = true, silent = true })
map('n', '<leader>du', '<Plug>(toggle-lsp-diag-underline)', {silent = true })
map('n', '<leader>ds', '<Plug>(toggle-lsp-diag-signs)', {silent = true })
map('n', '<leader>dv', '<Plug>(toggle-lsp-diag-vtext)', {silent = true })
map('n', '<leader>di', '<Plug>(toggle-lsp-diag-update_in_insert)', {silent = true })

map('n', '<Leader>c', ':CphReceive<CR>', { noremap = true, silent = true })
map('n', '<Leader>t', ':CphTest<CR>', { noremap = true, silent = true })
for i = 1, 9, 1 do
  map('n', string.format('<Leader>e%d', i),
    string.format(':CphEdit %d<CR>', i),
    { noremap = true, silent = true }
  )
end

map('n', '<F7>', ':NvimTreeToggle<CR>', {silent = true })

map('n', '<leader>md', ':MarkdownPreviewToggle<CR>', {silent = true })
map('n', '<Leader><Space>', ':noh<CR>', { noremap = true, silent = true })

map('n', '<Leader>p', ':Neoformat<CR>', { noremap = true, silent = true })

