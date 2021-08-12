require('bufferline').setup {
      options = {
        numbers = "ordinal",
        number_style = "",
        mappings = false,
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end,
        offsets = { { filetype = "nerdtree", text_align = "left" } },
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        sort_by = "id",
    },
--[[
    highlights = {
        background = {
            guibg = "#3B4252",
        },
        fill = {
            guibg = "#2E3440",
            guifg = "#D8DEE9",
        },
        separator = {
            guibg = "#3B4252",
            guifg = "#3B4252",
        },
        separator_selected = {
            guibg = "#2E3440",
            guifg = "#2E3440",
        },
        indicator_selected = {
            guibg = "#2E3440",
            guifg = "#2E3440",
        },
        modified = {
            guibg = "#3B4252",
        },
        diagnostic = {
            guibg = "#3B4252",
            guifg = "#5E687B",
        },
        warning = {
            guibg = "#3B4252",
        },
        warning_diagnostic = {
            guibg = "#3B4252",
            guifg = "#EBCB8B",
        },
        warning_diagnostic_selected = {
            guifg = "#EBCB8B",
        },
        error = {
            guibg = "#3B4252",
        },
        error_diagnostic = {
            guibg = "#3B4252",
            guifg = "#BF616A",
        },
        info = {
            guibg = "#3B4252",
        },
        info_diagnostic = {
            guibg = "#3B4252",
            guifg = "#5E687B",
        },
    },
    ]]
}

