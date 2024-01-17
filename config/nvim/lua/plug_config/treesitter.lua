-- include treesitter and its config
require('nvim-treesitter.configs').setup{

  ensure_installed = {'c', 'cpp', 'python', 'lua', 'typescript',
                      'regex', 'bash', 'cmake', 'css', 'javascript',
                      'html', 'comment', 'java', 'rust', 'go', 'markdown',
                      'make', 'json', 'vim'},
  highlight = {
    enable = true,
  },

  autotag = {
    enable = true,
  },

  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'grr',
      },
    },
  },
}


require('nvim-treesitter.parsers').get_parser_configs().asm = {
    install_info = {
        url = 'https://github.com/rush-rs/tree-sitter-asm.git',
        files = { 'src/parser.c' },
        branch = 'main',
    },
}
