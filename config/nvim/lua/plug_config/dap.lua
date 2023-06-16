require("dap").adapters.lldb = {
	type = "executable",
	command = "/sbin/lldb-vscode",
	name = "lldb",
}

require("dapui").setup()

local lldb = {
	name = "Launch lldb",
	type = "lldb",
	request = "launch", -- could also attach to a currently running process
	program = function()
		return vim.fn.input(
			"Path to executable: ",
			vim.fn.getcwd() .. "/",
			"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

require('dap').configurations.cpp = {
	lldb -- different debuggers or more configurations can be used here
}
