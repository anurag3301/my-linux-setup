map = vim.api.nvim_set_keymap

map('n', '<Leader>n', ':enew<CR>', { noremap = true, silent = true })
map('n', '<Leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<Leader>o', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
map('n', '<Leader>[', ':vertical resize +7<CR>', { noremap = true, silent = true })
map('n', '<Leader>]', ':vertical resize -7<CR>', { noremap = true, silent = true })
map('n', '<Leader>cc', ':ColorizerToggle<CR>', { noremap = true, silent = true })
map('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

map('n', '<Leader>dd', ':ToggleDiag<CR>', { noremap = true, silent = true })
map("n", "<leader>du", "<Plug>(toggle-lsp-diag-underline)", {silent = true })
map("n", "<leader>ds", "<Plug>(toggle-lsp-diag-signs)", {silent = true })
map("n", "<leader>dv", "<Plug>(toggle-lsp-diag-vtext)", {silent = true })
map("n", "<leader>di", "<Plug>(toggle-lsp-diag-update_in_insert)", {silent = true })

map('n', '<Leader>c', ':CphReceive<CR>', { noremap = true, silent = true })
map('n', '<Leader>t', ':CphTest<CR>', { noremap = true, silent = true })
for i = 1, 9, 1 do
  map('n', string.format('<Leader>e%d', i),
    string.format(':CphEdit %d<CR>', i),
    { noremap = true, silent = true }
  )
end

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

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
