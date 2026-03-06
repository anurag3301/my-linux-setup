local plugins = {
    {
        "neovim/nvim-lspconfig",
        'mfussenegger/nvim-jdtls',
        'onsails/lspkind-nvim',
        'ray-x/lsp_signature.nvim',
        'rmagatti/goto-preview',
        'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "ckipp01/stylua-nvim"
    },

    {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/nvim-cmp',
        'rafamadriz/friendly-snippets'
    },

    {
        'anuvyklack/pretty-fold.nvim',
        'hrsh7th/vim-vsnip',
        'mattn/emmet-vim',
        'marko-cerovac/material.nvim',
        'andweeb/presence.nvim',
        'RRethy/vim-illuminate',
        'norcalli/nvim-colorizer.lua'
    },
    {
        "startup-nvim/startup.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim", 
            "nvim-lua/plenary.nvim"
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
    },
    {
        'rush-rs/tree-sitter-asm',
    },
    {
        'windwp/nvim-autopairs',
        'windwp/nvim-ts-autotag',
    },

    {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'mfussenegger/nvim-dap-python',
        'theHamsta/nvim-dap-virtual-text',
    },


    {'akinsho/nvim-toggleterm.lua'},
    {'kdheepak/lazygit.nvim'},
    {'terrortylor/nvim-comment'},
    {'Pocco81/auto-save.nvim'},
    {'lewis6991/gitsigns.nvim'},
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },

    {'smoka7/hop.nvim', version = "*", opts = {},},
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {'p00f/cphelper.nvim', dependencies = {'nvim-lua/plenary.nvim', 'ygm2/rooter.nvim',}},
    {'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},


    {
      'anurag3301/nvim-platformio.lua',

      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies = {
        { 'akinsho/toggleterm.nvim' },
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'folke/which-key.nvim' },
      },
    },


    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
      "olrtg/nvim-emmet",
      config = function()
        vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
      end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            'saadparwaiz1/cmp_luasnip'
        }
    },
}

require("lazy").setup(plugins, opts)
