-- refer this wiki to know how to use path specifiers in vim 
-- https://vim.fandom.com/wiki/Get_the_name_of_the_current_file

local run_command_table = {
    ['asm'] = 'nasm -f elf64 % -o %:r.o && ld %:r.o -o %:r && ./%:r && rm %:r.o',
    ['cpp'] = 'g++ -g -Wall % -o %:r && ./%:r',
    ['c'] = 'gcc -g -Wall % -o %:r && ./%:r',
    ['python'] = 'python %',
    ['lua'] = 'lua %',
    ['java'] = 'cd %:h && javac *.java && java %:t:r',
    ['zsh'] = 'zsh %',
    ['sh'] = 'sh %',
    ['rust'] = 'rustc % && ./%:r',
    ['go'] = 'go run %',
    ['javascript'] = 'node %'
}

local debug_command_table = {
    ['cpp'] = 'g++ -g % -o %:r && gdb ./%:r',
    ['c'] = 'gcc -g % -o %:r && gdb ./%:r',
}

local extra = 'printf \"\\\\n\\\\033[0;33mPlease Press ENTER to continue \\\\033[0m\"; read'
local Terminal  = require('toggleterm.terminal').Terminal

function expand_symbol_resolver(cmd)
    local mod = string.byte("%")
    local space = string.byte(" ")
    local col = string.byte(":")
    local i=1
    local expanded_cmd=""
    while i <= #cmd do
        if cmd:byte(i) == mod then
            local j=i+1
            while cmd:byte(j) == col and cmd:byte(j+1) ~= space and j <= #cmd do
                j=j+2
            end
            expanded_cmd = expanded_cmd .. vim.fn.expand(string.sub(cmd, i, j-1))
            i=j
        end 
        expanded_cmd = expanded_cmd .. string.sub(cmd, i, i)
        i = i+1
    end

    return expanded_cmd
end


-- To run file run :Run or just press <F5>
function run_code()
    if (run_command_table[vim.bo.filetype]) then
       local expanded_cmd = expand_symbol_resolver(run_command_table[vim.bo.filetype])
       local runcmd = expanded_cmd .."; " .. extra
       local runterm = Terminal:new({ cmd = runcmd, direction = "float"})
       runterm:toggle()
   else
       print("\nFileType not supported\n")
   end
end


-- To run file run :Debug
function debug_code()
    if (debug_command_table[vim.bo.filetype]) then
       local expanded_cmd = expand_symbol_resolver(debug_command_table[vim.bo.filetype])
       local runcmd = expanded_cmd .."; " .. extra
       local debugterm = Terminal:new({ cmd = runcmd, direction = "float"})
       debugterm:toggle()
   else
       print("\nFileType not supported\n")
   end
end


local function strsplit (inputstr)
    local t={}
    for str in string.gmatch(inputstr, "([^\",\"]+)") do
        table.insert(t, str)
    end
    return t
end


-- Use the following function to update the execution command of a filetype temporarly
-- Usage :RunUpdate  --OR-- :RunUpdate filetype
-- If no argument is provided, the command is going to take the filetype of active buffer
function update_command_table(type, filetype)
    local command

    if(filetype == "")then
        filetype = vim.bo.filetype
    else
        filetype = string.sub(filetype, 2, -2)
    end

    filetype = strsplit(filetype)[1]
    
    if(type == 'run') then
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

    if(type == 'debug') then
        if(debug_command_table[filetype]) then
            command = vim.fn.input(string.format("Update debug command of filetype (%s): ", filetype),
            debug_command_table[filetype], 'file')
        else
            command = vim.fn.input(string.format("Add new debug command of filetype (%s): ", filetype))
        end
        if(#command ~= 0) then
            debug_command_table[filetype] = command
            print("  Updated!")
        end
    end
end
