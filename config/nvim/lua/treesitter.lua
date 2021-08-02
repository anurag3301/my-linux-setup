-- include treesitter and its config
require("nvim-treesitter.configs").setup{
  ensure_installed = {"c", "cpp"},
  highlight = {
    enable = true,
    disable = {},
  },
}

