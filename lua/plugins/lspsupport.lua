
return {
    {"williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end,
    },
    {"williamboman/mason-lspconfig.nvim",
        config = function()
        
        require("mason-lspconfig").setup { ensure_installed = { "bsl_ls", "rust_analyzer" } }

        require("mason-lspconfig").setup_handlers {
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                ["bsl_ls"] = function ()
                    require'lspconfig'.bsl_ls.setup {
                        root_dir = function(fname)
                                       local util = require 'lspconfig/util'
                                       return util.find_git_ancestor(fname) or util.path.dirname(fname)
                                   end,
                        cmd = {vim.fn.stdpath('data') .. "/mason/bin/bsl-language-server", "lsp"}
                    }
                end
        }
                end,
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
