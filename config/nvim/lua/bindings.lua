keymap = vim.keymap.set

-- LSP bindings: nivm/lua/plug_config/lsp_config/lsp-config.lua

    
-- Telescope bindings
function _find_files()
    local is_git = os.execute("git status &>/dev/null")
    if (is_git == 0) then
        vim.cmd(":Telescope git_files")
    else
        vim.cmd(":Telescope find_files")
    end
end

keymap('n', '<Leader>f', _find_files)
keymap('n', '<Leader>o', ':Telescope oldfiles<CR>')
keymap('n', '<Leader>s', ':Telescope live_grep<CR>')

-- Bracey bindings
keymap('n', '<Leader>b', ':Bracey<CR>')
keymap('n', '<Leader>bb', ':BraceyStop<CR>')
keymap('n', '<Leader>bbb', ':BraceyReload<CR>')

-- Bufferline bindings
keymap('n', 'f', ':BufferLinePick<CR>')
keymap('n', 'F', ':BufferLinePickClose<CR>')
keymap('n', '<TAB>', ':BufferLineCycleNext<CR>')
keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')
keymap('n', 'm.', ':BufferLineMoveNext<CR>')
keymap('n', 'm,', ':BufferLineMovePrev<CR>')

-- Hope bindings
keymap('n', ';j', ':HopWord<CR>')
keymap('n', ';l', ':HopLineStart<CR>')

-- LSP Diagnostics Toggle bindings
keymap('n', '<Leader>dd', ':ToggleDiag<CR>')
keymap('n', '<leader>du', '<Plug>(toggle-lsp-diag-underline)')
keymap('n', '<leader>ds', '<Plug>(toggle-lsp-diag-signs)')
keymap('n', '<leader>dv', '<Plug>(toggle-lsp-diag-vtext)')
keymap('n', '<leader>di', '<Plug>(toggle-lsp-diag-update_in_insert)')

-- CPHelper bindings
keymap('n', '<Leader>c', ':CphReceive<CR>')
keymap('n', '<Leader>t', ':CphTest<CR>')
for i = 1, 9, 1 do
  keymap('n', string.format('<Leader>e%d', i),
    string.format(':CphEdit %d<CR>', i))
end

-- Binding for code runner
keymap('n', '<F5>', ':Run<CR>')

-- Other bindings nvimtree, markdown preview, Neoformat, Colorizer, LazyGit
keymap('n', '<F7>', ':NvimTreeToggle<CR>')
keymap('n', '<leader>md', ':MarkdownPreviewToggle<CR>')
keymap('n', '<Leader>p', ':Neoformat<CR>')
keymap('n', '<Leader>cc', ':ColorizerToggle<CR>')
keymap('n', '<Leader>gg', ':LazyGit<CR>')
keymap('n', '<Leader>n', ':enew<CR>')
keymap('n', '<Leader><Space>', ':noh<CR>')
keymap('n', '<Leader>[', ':vertical resize +7<CR>')
keymap('n', '<Leader>]', ':vertical resize -7<CR>')

vim.cmd(':tnoremap <Esc> <C-\\><C-n>')
