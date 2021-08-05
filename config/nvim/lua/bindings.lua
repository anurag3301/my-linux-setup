map = vim.api.nvim_set_keymap

map('n', '<Leader>n', ':enew<CR>', { noremap = true, silent = true })
map('n', '<Leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<Leader>o', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
map('n', '<Leader>[', ':vertical resize +7<CR>', { noremap = true, silent = true })
map('n', '<Leader>]', ':vertical resize -7<CR>', { noremap = true, silent = true })
map('n', '<Leader>cc', ':ColorizerToggle<CR>', { noremap = true, silent = true })

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

