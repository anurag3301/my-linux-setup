-- Nerd tree config
vim.g.NERDTreeFileExtensionHighlightFullName = 1
vim.g.NERDTreeExactMatchHighlightFullName = 1
vim.g.NERDTreePatternMatchHighlightFullName = 1
vim.api.nvim_set_keymap('n', '<F7>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

