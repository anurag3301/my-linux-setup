require("dap").adapters.lldb = {
	type = "executable",
	command = "/sbin/lldb-vscode",
	name = "lldb",
}

require("dapui").setup()

dap_program = nil
local lldb = {
	name = "Launch lldb",
	type = "lldb",
	request = "launch",
	program = function()
        if dap_program == nil then
            dap_program = vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end
        return dap_program

	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

require('dap').configurations.cpp = {lldb}
require('dap').configurations.c = {lldb}
require('dap').configurations.rust = {lldb}

dap_running = false
local function dap_start()
    require('dap').continue()
    require('dapui').open()
    vim.opt['mouse'] = 'a'
    dap_running = true
end


local function dap_exit()
    vim.opt['mouse'] = 'c'
    require('dap').close()
    require('dapui').close()
    dap_running = false
end

function dap_toggle()
    if dap_running then
        dap_exit()
    else
        dap_start()
    end
end
