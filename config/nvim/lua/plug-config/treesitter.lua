-- include treesitter and its config
require("nvim-treesitter.configs").setup{

  ensure_installed = {"c", "cpp", "python", "lua", "typescript",
                      "regex", "bash", "cmake", "css", "javascript",
                      "html", "comment"},
  highlight = {
    enable = true,
    disable = {},
  },
}

