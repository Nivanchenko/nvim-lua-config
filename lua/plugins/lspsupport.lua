
return {
    {"williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end,
    },
    {"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "lua_ls", "rust_analyzer" },
	    }
    },
"neovim/nvim-lspconfig",
  {'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
        ui =  {
               code_action = ''
              }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
    }},
}
