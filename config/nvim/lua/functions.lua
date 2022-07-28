-- Telescope bindings
function _find_files()
    local is_git = os.execute("git status &>/dev/null")
    if (is_git == 0) then
        vim.cmd(":Telescope git_files")
    else
        vim.cmd(":Telescope find_files")
    end
end

-- Function to jump to neovim config
function config_nvim()
    local config_path = vim.fn.stdpath('config')
    vim.cmd('cd ' .. config_path)
    vim.cmd('e init.lua')
    -- vim.cmd('NvimTreeOpen')
    -- local buffers = vim.api.nvim_list_bufs()
    -- for _, buffer in ipairs(buffers) do
    --     if vim.api.nvim_buf_is_loaded(buffer) then
    --         local filename = vim.api.nvim_buf_get_name(buffer)
    --         if #filename ~= 0 and not string.find(filename, 'NvimTree') then
    --             print(#filename, filename, buffer)
    --             vim.api.nvim_set_current_win(buffer)
    --             return
    --         end
    --     end
    -- end
end

