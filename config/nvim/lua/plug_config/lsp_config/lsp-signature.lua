-- Read the docs `:h lsp_signature-contents`
-- Plugin's github: https://github.com/ray-x/lsp_signature.nvim

local config = {
   doc_lines = 0,
   hint_enable = false,
   shadow_guibg = 'Black',
}

require "lsp_signature".setup(config)
