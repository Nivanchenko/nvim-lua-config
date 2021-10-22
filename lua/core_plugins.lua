return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}
	use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/nvim-cmp' }
end)
