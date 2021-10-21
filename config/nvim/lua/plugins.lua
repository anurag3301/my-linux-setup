return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'marko-cerovac/material.nvim'
	use "Pocco81/AutoSave.nvim"
	use 'norcalli/nvim-colorizer.lua'
	use 'terrortylor/nvim-comment'

	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}	  
	use {
		'akinsho/bufferline.nvim', 
		requires = 'kyazdani42/nvim-web-devicons'
	}

end)