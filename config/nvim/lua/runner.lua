local run_command_table = {
    ['cpp'] = 'g++ %:t -o %:r && ./%:r',
    ['c'] = 'gcc %:t -o %:r && ./%:r',
    ['python'] = 'python %:t',
    ['lua'] = 'lua %:t',
    ['java'] = 'javac %:t && java %:r',
    ['zsh'] = 'zsh %:t',
    ['sh'] = 'sh %:t',
    ['rust'] = 'rustc %:t && ./%:r',
    ['go'] = 'go run %:t'
}

local extra = 'echo \"\\\\n\\\\033[0;33mPlease Press ENTER to continue \\\\033[0m\"; read; exit;'

function run_code()
    if (run_command_table[vim.bo.filetype]) then
       vim.cmd("2TermExec cmd='".. run_command_table[vim.bo.filetype].."; " .. extra .. "' direction=float")
   else
       print("\nFileType not supported\n")
   end
end

-- Use the following function to update the execution command of a filetype temporarly
-- Usage :lua update_command_table(filetype, new_command)
-- Example :lua update_command_table('python', 'python %:t argument1 argument2')
function update_command_table(filetype, new_command)
    run_command_table[filetype] = new_command
    print(string.format("Run command for filetype: %s is being changed to '%s' temporarly.", filetype, new_command))
end
