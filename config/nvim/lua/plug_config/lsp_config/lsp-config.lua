-- Use following commadn to install language server in arch using pacman, paru(AUR) and npm

-- sudo pacman -S pyright bash-language-server lua-language-server ccls haskell-language-server typescript-language-server 
-- paru -S cmake-language-server-git cssmodules-language-server j phpactordtls phpactor
-- npm i -g vscode-langservers-extracted 
-- cargo install --git https://github.com/bergercookie/asm-lsp

-- If you dont use Arch then check the installation process for your distro.

local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {'pylsp', 'tsserver', 'hls', 'cmake', 'html', 'cssls', 'rust_analyzer', 'lua_ls', 'bashls', 'marksman', 'phpactor', 'asm_lsp'}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        root_dir = function() return vim.loop.cwd() end
    }
end

nvim_lsp['ccls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    init_options = {
        cache = {
            directory = "/tmp/ccls-cache"
        }
    },
    root_dir = function() return vim.loop.cwd() end
}

