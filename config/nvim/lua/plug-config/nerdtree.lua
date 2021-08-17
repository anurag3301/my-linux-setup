-- Nerd tree config
vim.g.NERDTreeFileExtensionHighlightFullName = 1
vim.g.NERDTreeExactMatchHighlightFullName = 1
vim.g.NERDTreePatternMatchHighlightFullName = 1
vim.api.nvim_set_keymap('n', '<F7>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeGitStatusUseNerdFonts = 1
vim.cmd([[
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])
