return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)