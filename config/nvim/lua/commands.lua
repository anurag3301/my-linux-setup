
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
