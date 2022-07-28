-- Telescope bindings
function _find_files()
    local is_git = os.execute("git status &>/dev/null")
    if (is_git == 0) then
        vim.cmd(":Telescope git_files")
    else
        vim.cmd(":Telescope find_files")
    end
end
