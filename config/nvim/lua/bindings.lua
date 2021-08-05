vim.api.nvim_set_keymap('n', '<Leader>n', ':enew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>o', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>[', ':vertical resize +7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>]', ':vertical resize -7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cc', ':ColorizerToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>dd', ':ToggleDiag<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>du", "<Plug>(toggle-lsp-diag-underline)", {silent = true })
vim.api.nvim_set_keymap("n", "<leader>ds", "<Plug>(toggle-lsp-diag-signs)", {silent = true })
vim.api.nvim_set_keymap("n", "<leader>dv", "<Plug>(toggle-lsp-diag-vtext)", {silent = true })
vim.api.nvim_set_keymap("n", "<leader>di", "<Plug>(toggle-lsp-diag-update_in_insert)", {silent = true })

vim.api.nvim_set_keymap('n', '<Leader>c', ':CphReceive<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':CphTest<CR>', { noremap = true, silent = true })
for i = 1, 9, 1 do
  vim.api.nvim_set_keymap('n',
    string.format('<Leader>e%d', i),
    string.format(':CphEdit %d<CR>', i),
    { noremap = true, silent = true }
  )
end

