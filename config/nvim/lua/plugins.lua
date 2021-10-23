return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- apperative plugins
	use 'hrsh7th/vim-vsnip'
	use 'glepnir/dashboard-nvim'
	use 'marko-cerovac/material.nvim'
	use 'andweeb/presence.nvim'
  
	-- functional plugins
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
	use 'kabouzeid/nvim-lspinstall'
	use 'nvim-treesitter/nvim-treesitter'
	use 'akinsho/nvim-toggleterm.lua'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'norcalli/nvim-colorizer.lua'
	use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
	use 'kdheepak/lazygit.nvim'
	use 'terrortylor/nvim-comment'
	use "rafamadriz/friendly-snippets"
	use "Pocco81/AutoSave.nvim"
	use "jbyuki/venn.nvim"
	use "turbio/bracey.vim"
  
	use {
	  'lewis6991/gitsigns.nvim',
	  requires = {
		'nvim-lua/plenary.nvim'
	  }
	}
  
	use {
	'phaazon/hop.nvim',
	as = 'hop'
	}
  
	use {
	  'akinsho/nvim-bufferline.lua',
	  requires = 'kyazdani42/nvim-web-devicons'
	}
  
	use {
	  'p00f/cphelper.nvim',
	  rocks = 'http',
	  requires = {
		'nvim-lua/plenary.nvim',
		'ygm2/rooter.nvim',
		opt = true
	  }
	}
  
	use {
	  'hoob3rt/lualine.nvim',
	  requires = {
		'kyazdani42/nvim-web-devicons',
		opt = true
	  }
	}
  
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

end)
