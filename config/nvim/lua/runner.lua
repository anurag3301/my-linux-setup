local run_command_table = {
    ['cpp'] = 'g++ %:t -o %:r && ./%:r',
}

function run_code()
    if (run_command_table[vim.bo.filetype]) then
       vim.cmd('2TermExec cmd="'.. run_command_table[vim.bo.filetype]..'" direction=float')
   else
       print("\nFileType not supported\n")
   end
end

