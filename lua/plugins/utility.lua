return {

    {'nvim-telescope/telescope.nvim',
           requires = { {'nvim-lua/plenary.nvim'} }
    },

    {"folke/which-key.nvim",
        config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup { }
        end
    },
}

