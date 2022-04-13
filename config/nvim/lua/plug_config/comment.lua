require('nvim_comment').setup({
  comment_empty = false,
  marker_padding = true,
  create_mappings = true,
  line_mapping = 'gcc',
  operator_mapping = 'gc',
  hook = nil
})

vim.cmd([[
autocmd BufEnter *.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
autocmd BufFilePost *.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
]])
