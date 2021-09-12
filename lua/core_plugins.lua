return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}
	use { 'neovim/nvim-lspconfig' }
	use { 'hrsh7th/nvim-compe' }
end)
