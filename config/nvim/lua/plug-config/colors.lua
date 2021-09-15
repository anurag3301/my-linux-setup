-- Material Theme config
vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = true
vim.g.material_contrast = true
vim.g.material_borders = true
vim.g.material_disable_background = false
vim.cmd("colorscheme material")
vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })


