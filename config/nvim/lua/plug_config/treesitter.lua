-- include treesitter and its config
require("nvim-treesitter.configs").setup{

  ensure_installed = {"c", "cpp", "python", "lua", "typescript",
                      "regex", "bash", "cmake", "css", "javascript",
                      "html", "comment"},
  highlight = {
    enable = true,
    disable = {},
  },
  rainbow = {
    enable = false,
    -- disable = { "jsx", "cpp" },
    extended_mode = true,
    max_file_lines = nil,
    -- colors = {},
    -- termcolors = {}
  },

  autotag = {
    enable = true,
  }
}

