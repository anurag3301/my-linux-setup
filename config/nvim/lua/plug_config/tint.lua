require("tint").setup({
  tint = -30,
  saturation = 0.6,
  transforms = require("tint").transforms.SATURATE_TINT,
  tint_background_colors = false,
  highlight_ignore_patterns = { "WinSeparator", "Status.*" },
  window_ignore_function = function(winid)
    local bufid = vim.api.nvim_win_get_buf(winid)
    local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
    local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

    return buftype == "terminal" or floating
  end
})
