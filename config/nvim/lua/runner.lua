-- refer this wiki to know how to use path specifiers in vim 
-- https://vim.fandom.com/wiki/Get_the_name_of_the_current_file

local run_command_table = {
    ['cpp'] = 'g++ % -o %:r && ./%:r',
    ['c'] = 'gcc % -o %:r && ./%:r',
    ['python'] = 'python %',
    ['lua'] = 'lua %',
    ['java'] = 'javac % && java %:r',
    ['zsh'] = 'zsh %',
    ['sh'] = 'sh %',
    ['rust'] = 'rustc % && ./%:r',
    ['go'] = 'go run %',
    ['javascript'] = 'node %'
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
-- Usage :lua update_command_table(filetype) --OR-- :RunUpdate filetype
-- Example :RunUpdate python
function update_command_table(filetype)
    local command

    if(run_command_table[filetype]) then
        command = vim.fn.input(string.format("Update run command of filetype (%s): ", filetype),
        run_command_table[filetype], 'file')
    else
        command = vim.fn.input(string.format("Add new run command of filetype (%s): ", filetype))
    end

    if(#command ~= 0) then
        run_command_table[filetype] = command
        print("  Updated!")
    end
end

