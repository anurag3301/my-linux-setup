function run_code()
    if (vim.bo.filetype == 'cpp')
    then
       vim.cmd('2TermExec cmd="timeout 4 g++ -std=c++17 %:t -o %:r && ./%:r" direction=float')
    end
end
