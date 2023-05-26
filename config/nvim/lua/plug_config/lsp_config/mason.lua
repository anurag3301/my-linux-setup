require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { 'pylsp', 'tsserver', 'cmake', 'html', 'rust_analyzer', 'lua_ls', 'bashls', 'marksman', 'phpactor', 'asm_lsp'},
}
