local treesitter = require('nvim-treesitter')
local parsers_config = require('nvim-treesitter.parsers')

local parsers = {
  'c',
  'cpp',
  'python',
  'lua',
  'typescript',
  'regex',
  'bash',
  'cmake',
  'css',
  'javascript',
  'html',
  'comment',
  'java',
  'rust',
  'go',
  'markdown',
  'make',
  'json',
  'vim',
  'asm',
}

treesitter.setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

parsers_config.asm = {
  install_info = {
    url = 'https://github.com/rush-rs/tree-sitter-asm.git',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}

treesitter.install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function(args)
    vim.treesitter.start(args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

pcall(function()
  require('nvim-ts-autotag').setup()
end)
