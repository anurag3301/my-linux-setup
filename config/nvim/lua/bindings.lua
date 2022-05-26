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
keymap('n', '<Leader>o', '<cmd> Telescope oldfiles <cr>')
keymap('n', '<Leader>s', '<cmd> Telescope live_grep <cr>')

-- Bracey bindings
keymap('n', '<Leader>b',    '<cmd> Bracey <cr>')
keymap('n', '<Leader>bb',   '<cmd> BraceyStop <cr>')
keymap('n', '<Leader>bbb',  '<cmd> BraceyReload <cr>')

-- Bufferline bindings
keymap('n', 'f',        '<cmd> BufferLinePick <cr>')
keymap('n', 'F',        '<cmd> BufferLinePickClose <cr>')
keymap('n', '<TAB>',    '<cmd> BufferLineCycleNext <cr>')
keymap('n', '<S-TAB>',  '<cmd> BufferLineCyclePrev <cr>')
keymap('n', 'm.',       '<cmd> BufferLineMoveNext <cr>')
keymap('n', 'm,',       '<cmd> BufferLineMovePrev <cr>')

-- Hope bindings
keymap('n', ';j', '<cmd> HopWord <cr>')
keymap('n', ';l', '<cmd> HopLineStart <cr>')

-- LSP Diagnostics Toggle bindings
keymap('n', '<Leader>dd', '<cmd> ToggleDiag <cr>')
keymap('n', '<leader>du', '<Plug>(toggle-lsp-diag-underline)')
keymap('n', '<leader>ds', '<Plug>(toggle-lsp-diag-signs)')
keymap('n', '<leader>dv', '<Plug>(toggle-lsp-diag-vtext)')
keymap('n', '<leader>di', '<Plug>(toggle-lsp-diag-update_in_insert)')

-- CPHelper bindings
keymap('n', '<Leader>c', '<cmd> CphReceive <cr>')
keymap('n', '<Leader>t', '<cmd> CphTest <cr>')
for i = 1, 9, 1 do
  keymap('n', string.format('<Leader>e%d', i),
    string.format('<cmd> CphEdit %d <cr>', i))
end

-- Binding for code runner
keymap('n', '<F5>', '<cmd> Run <cr>')

-- Other bindings nvimtree, markdown preview, Neoformat, Colorizer, LazyGit
keymap('n', '<F7>',            '<cmd> NvimTreeToggle <cr>')
keymap('n', '<leader>md',      '<cmd> MarkdownPreviewToggle <cr>')
keymap('n', '<Leader>p',       '<cmd> Neoformat <cr>')
keymap('n', '<Leader>cc',      '<cmd> ColorizerToggle <cr>')
keymap('n', '<Leader>gg',      '<cmd> LazyGit <cr>')
keymap('n', '<Leader>n',       '<cmd> enew <cr>')
keymap('n', '<Leader><Space>', '<cmd> noh <cr>')
keymap('n', '<Leader>[',       '<cmd> vertical resize +7 <cr>')
keymap('n', '<Leader>]',       '<cmd> vertical resize -7 <cr>')

vim.cmd(':tnoremap <Esc> <C-\\><C-n>')
