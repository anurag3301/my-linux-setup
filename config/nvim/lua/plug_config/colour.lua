-- Material Theme config

vim.cmd[[colorscheme material]]
vim.g.material_style = "deep ocean"
require('material').setup({
	contrast = true,
	borders = true,
	popup_menu = "dark",

	italics = {
		comments = true,
		keywords = true,
		functions = true,
		strings = true,
		variables = false 
	},

	contrast_windows = {
		"terminal",
		"packer",
		"qf"
	},

	text_contrast = {
		lighter = false,
		darker = true
	},
	disable = {
		background = false,
		term_colors = false,
		eob_lines = false
	},
})