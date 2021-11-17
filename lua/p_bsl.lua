
local packer = require('packer')
packer.use({ 'andreevlex/vim-language-1c-bsl' })
packer.use({ '1c-syntax/vsc-language-1c-bsl' })

pcall(function()
    local util = require 'lspconfig/util'

    -- Любым удобным способом указываем путь к бинарю
    local bslbinary = vim.fn.stdpath('data') .. "/bsl-language-server/bin/bsl-language-server"

    local caps = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Подключаем модуль lsp конфига, и запускаем анализатор bsl
    require'lspconfig'.bsl_ls.setup {
        root_dir = function(fname)
                       return util.find_git_ancestor(fname) or util.path.dirname(fname)
                   end,
        -- Определяем команду, которой запускается lsp 
        capabilities = caps,
        cmd = {bslbinary, "lsp"}
    }

    vim.cmd([[
    nnoremap <C-b> :set syntax=bsl<CR>
    ]])
end)
