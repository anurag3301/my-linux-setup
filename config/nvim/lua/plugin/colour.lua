vim.cmd[[colorscheme material]]
vim.g.material_style = "deep ocean"
require('material').setup({
	contrast = true,
	borders = false,
	popup_menu = "dark",

	italics = {
		comments = false,
		keywords = false,
		functions = false,
		strings = false,
		variables = false
	},

	contrast_windows = {
		"terminal",
		"packer",
		"qf"
	},

	text_contrast = {
		lighter = false,
		darker = false
	},
	disable = {
		background = false,
		term_colors = false,
		eob_lines = false
	},
})