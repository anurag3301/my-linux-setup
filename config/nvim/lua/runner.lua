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

function run_code()
    if (run_command_table[vim.bo.filetype]) then
       vim.cmd('2TermExec cmd="'.. run_command_table[vim.bo.filetype]..'" direction=float')
   else
       print("\nFileType not supported\n")
   end
end

