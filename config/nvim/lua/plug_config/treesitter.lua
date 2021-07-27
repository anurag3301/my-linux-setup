require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "rust",
        "python",
        "lua",
        "yaml",
        "bash",
        "fish",
        "tsx",
        "javascript",
        "json",
        "haskell",
        "typescript",
        "toml",
        "html",
        "css",
    },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true },
})
