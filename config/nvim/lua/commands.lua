
local commands_table = {
    ['Tff'] = 'find_files',
    ['Tof'] = 'oldfiles',
    ['Tlg'] = 'live_grep',
    ['Tsh'] = 'search_history',
    ['Tqf'] = 'quickfix',
    ['Tvo'] = 'vim_options',
    ['Tss'] = 'spell_suggest',
    ['Treg'] = 'registers',
    ['Tcmd'] = 'commands',
    ['Thlp'] = 'help_tags',
    ['Tman'] = 'man_pages',
    ['Tkey'] = 'keymaps',
    ['Tcol'] = 'colorscheme',
    ['Tacmd'] = 'autocommands',
    ['Tgstr'] = 'grep_string',

    ['Tlrf'] = 'lsp_references',
    ['Tlds'] = 'lsp_document_symbols',
    ['Tlws'] = 'lsp_workspace_symbols',
    ['Tlca'] = 'lsp_code_actions',
    ['Tltd'] = 'lsp_type_definitions',
    ['Tld'] = 'diagnostics',
    ['Tli'] = 'lsp_implementations',
    ['Tld'] = 'lsp_definitions',

    ['Tgc'] = 'git_commits',
    ['Tgb'] = 'git_branches',
    ['Tgs'] = 'git_status',
    ['Tgf'] = 'git_files',

}

for command, action in pairs(commands_table) do
    vim.cmd('command! ' .. command .. ' :Telescope '.. action)
end

vim.cmd('command! Run :lua run_code()')
vim.cmd('command! Debug :lua debug_code()')

vim.cmd('command! -nargs=* RunUpdate :lua update_command_table("run", \'<f-args>\')')
vim.cmd('command! -nargs=* DebugUpdate :lua update_command_table("debug", \'<f-args>\')')

vim.cmd('command CD cd %:p:h')

vim.cmd('command -nargs=1 CreateNeorgWorkspace :lua createNeorgWorkspace(<f-args>)')

local function lsp_info()
    local bufnr = vim.api.nvim_get_current_buf()
    local filetype = vim.bo[bufnr].filetype
    local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })
    local all_clients = vim.lsp.get_clients()

    local lines = {
        'LSP Status',
        '---------',
        'Buffer: ' .. vim.api.nvim_buf_get_name(bufnr),
        'Filetype: ' .. filetype,
        'Attached to current buffer: ' .. #buf_clients,
    }

    if #buf_clients > 0 then
        for _, client in ipairs(buf_clients) do
            table.insert(lines, ('  - %s (id=%d)'):format(client.name, client.id))
        end
    end

    table.insert(lines, '')
    table.insert(lines, 'All running clients: ' .. #all_clients)
    if #all_clients > 0 then
        for _, client in ipairs(all_clients) do
            table.insert(lines, ('  - %s (id=%d)'):format(client.name, client.id))
        end
    end

    vim.notify(table.concat(lines, '\n'), vim.log.levels.INFO, { title = 'LSPInfo' })
end

vim.api.nvim_create_user_command('LSPInfo', lsp_info, { desc = 'Show active LSP clients' })
if vim.fn.exists(':LspInfo') == 0 then
    vim.api.nvim_create_user_command('LspInfo', lsp_info, { desc = 'Show active LSP clients' })
end
