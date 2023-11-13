local handel = io.popen("which python")
local python_path = handel:read("*a") 
python_path = string.gsub(python_path, "\n", "")
require('dap-python').setup(python_path)

require("dap").adapters.lldb = {
	type = "executable",
	command = "/sbin/lldb-vscode",
	name = "lldb",
}

require("dapui").setup()
require("nvim-dap-virtual-text").setup()

dap_program = nil
dap_args = nil

local lldb = {
	name = "Launch lldb",
	type = "lldb",
	request = "launch",
	program	= nil,
    cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = nil,
	runInTerminal = false,
}


function configure_lldb()
    dap_program = vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
    )

    arg_str = vim.fn.input("Enter the args for the program: ")
    dap_args = {}
    for arg in string.gmatch(arg_str, "[^ ]+") do
        table.insert(dap_args, arg)
    end

    lldb['program'] = dap_program
    lldb['args'] = dap_args

    require('dap').configurations.cpp = {lldb}
    require('dap').configurations.c = {lldb}
    require('dap').configurations.rust = {lldb}
end


dap_running = false
local function dap_start()
    print(dap_args)
    print(dap_program)
    if vim.bo.filetype == 'cpp' or 
        vim.bo.filetype == 'c' or
        vim.bo.filetype == 'rust' and
        dap_args == nil and
        dap_program == nil 
     then
        configure_lldb()
    end
    print(dap_args)
    print(dap_program)

    require('dap').continue()
    require('dapui').open()
    vim.opt['mouse'] = 'a'
    require'nvim-dap-virtual-text'.enable()
    dap_running = true
end


local function dap_exit()
    vim.opt['mouse'] = 'c'
    require('dap').close()
    require('dapui').close()
    require'nvim-dap-virtual-text'.disable()
    dap_running = false
end

function dap_toggle()
    if dap_running then
        dap_exit()
    else
        dap_start()
    end
end
