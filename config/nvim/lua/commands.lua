
local commands_table = {
    ['Treg'] = 'registers',
    ['Tcmd'] = 'commands',
    ['Thlp'] = 'help_tags',
    ['Tman'] = 'man_pages',
    ['Tcol'] = 'colorscheme',
    ['Tff'] = 'find_files',
    ['Tof'] = 'oldfiles',
    ['Tgstr'] = 'grep_string',
    ['Tlg'] = 'live_grep',
    ['Tsh'] = 'search_history',
    ['Tqf'] = 'quickfix',
    ['Tvo'] = 'vim_options',
    ['Tacmd'] = 'autocommands',
    ['Tss'] = 'spell_suggest',
    ['Tkey'] = 'keymaps',

    ['Tlrf'] = 'lsp_references',
    ['Tlds'] = 'lsp_document_symbols',
    ['Tlws'] = 'lsp_workspace_symbols',
    ['Tlca'] = 'lsp_code_actions',
    ['Tld'] = 'diagnostics',
    ['Tli'] = 'lsp_implementations',
    ['Tld'] = 'lsp_definitions',
    ['Tltd'] = 'lsp_type_definitions',

    ['Tgc'] = 'git_commits',
    ['Tgb'] = 'git_branches',
    ['Tgs'] = 'git_status',
    ['Tgf'] = 'git_files',

}

for command, action in pairs(commands_table) do
    vim.cmd('command! ' .. command .. ' :Telescope '.. action)
end

vim.cmd('command! Run :lua run_code()')
