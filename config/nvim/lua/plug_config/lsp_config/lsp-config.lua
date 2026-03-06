local c_cpp_server = 'ccls' -- set to 'clangd' or 'ccls'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function root_dir(bufnr, on_dir)
  local fname = vim.api.nvim_buf_get_name(bufnr)
  local root = vim.fs.root(fname, {
    '.git',
    'compile_commands.json',
    'compile_flags.txt',
    '.clangd',
    'CMakeLists.txt',
    'Makefile',
  })
  on_dir(root or vim.uv.cwd())
end

local common = {
  capabilities = capabilities,
  root_dir = root_dir,
  flags = {
    debounce_text_changes = 150,
  },
}

-- Keep unrelated/undesired servers from attaching globally.
vim.lsp.enable('gitlab_duo', false)
vim.lsp.enable('tvm_ffi_navigator', false)

local function can_exec(commands)
  for _, cmd in ipairs(commands) do
    if vim.fn.executable(cmd) == 1 then
      return true
    end
  end
  return false
end

local function configure_and_enable(server, opts, commands)
  if commands and not can_exec(commands) then
    return
  end
  vim.lsp.config(server, vim.tbl_deep_extend('force', common, opts or {}))
  vim.lsp.enable(server)
end

configure_and_enable('pyright', {}, { 'pyright-langserver' })

configure_and_enable('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}, { 'lua-language-server' })

configure_and_enable('bashls', {}, { 'bash-language-server' })
configure_and_enable('jsonls', {}, { 'vscode-json-language-server' })
configure_and_enable('yamlls', {}, { 'yaml-language-server' })
configure_and_enable('marksman', {}, { 'marksman' })
configure_and_enable('html', {}, { 'vscode-html-language-server' })
configure_and_enable('cssls', {}, { 'vscode-css-language-server' })
configure_and_enable('ts_ls', {}, { 'typescript-language-server' })
configure_and_enable('rust_analyzer', {}, { 'rust-analyzer', 'rust_analyzer' })

if c_cpp_server == 'clangd' and vim.fn.executable('clangd') == 1 then
  vim.lsp.config('clangd', vim.tbl_deep_extend('force', common, {}))
  vim.lsp.enable('clangd')
elseif c_cpp_server == 'ccls' and vim.fn.executable('ccls') == 1 then
  vim.lsp.config('ccls', vim.tbl_deep_extend('force', common, {
    init_options = {
      cache = {
        directory = '/tmp/ccls-cache',
      },
    },
  }))
  vim.lsp.enable('ccls')
end
