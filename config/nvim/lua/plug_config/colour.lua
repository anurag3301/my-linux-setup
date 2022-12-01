-- Material Theme config
vim.g.material_style = 'deep ocean'

require('material').setup({

    contrast = {
        terminal = false,
        sidebars = true,
        floating_windows = true,
        cursor_line = false,
        non_current_windows = false,
        filetypes = {
            'terminal',
            'packer',
            'qf',
            'toggleterm'
        },
    },

    styles = {
        comments = { italic = true },
        strings = {},
        keywords = {},
        functions = { italic = true },
        variables = {},
        operators = {},
        types = { bold = true },
    },

    plugins = {
        -- "dap",
        "dashboard",
        "gitsigns",
        "hop",
        -- "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        -- "sneak",
        "telescope",
        -- "trouble",
        -- "which-key",
    },

    disable = {
        colored_cursor = false,
        borders = false,
        background = false,
        term_colors = false,
        eob_lines = false
    },

    high_visibility = {
        lighter = false,
        darker = false
    },

    lualine_style = "default",

    async_loading = true,

    custom_colors = nil,

    custom_highlights = {},
})

vim.cmd 'colorscheme material'

vim.cmd("highlight WinSeparator guifg=#c0bfbc")
