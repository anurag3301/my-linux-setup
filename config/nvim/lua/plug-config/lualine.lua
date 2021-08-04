-- include lualine and its config
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'material-nvim',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          color_error = "#BF616A",
          color_warn = "#EBCB8B",
          color_info = "#88C0D0",
          color_hint = "#3A4151",
        },
      },
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {}
}
