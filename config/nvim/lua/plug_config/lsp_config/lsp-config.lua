-- Use following commadn to install language server in arch using pacman, paru(AUR) and npm

-- sudo pacman -S pyright bash-language-server lua-language-server ccls haskell-language-server typescript-language-server 
-- paru -S arduino-language-server cmake-language-server-git cssmodules-language-server jdtls
-- npm i -g vscode-langservers-extracted 

-- If you dont use Arch then check the installation process for your distro.

local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {'pyright', 'arduino_language_server', 'tsserver', 'hls', 'cmake', 'html', 'cssls', 'rust_analyzer', 'sumneko_lua', 'bashls', 'ccls', 'marksman'}

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
