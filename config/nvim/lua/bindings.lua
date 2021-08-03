vim.api.nvim_set_keymap('n', '<Leader>n', ':enew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>[', ':vertical resize +7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>]', ':vertical resize -7<CR>', { noremap = true, silent = true })

