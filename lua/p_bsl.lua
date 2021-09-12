
local packer = require('packer')

packer.use(
    { 'Nivanchenko/bsl-lsp.nvim' }
 )

packer.use(
    { 'andreevlex/vim-language-1c-bsl' }
)

pcall(function()
    -- Непосредственно подключение к bsl lsp
    require('bsl-lsp')

    -- Любым удобным способом указываем путь к бинарю
    local bslbinary = vim.fn.stdpath('data') .. "/bsl-language-server/bin/bsl-language-server"

    -- Подключаем модуль lsp конфига, и запускаем анализатор bsl
    require'lspconfig'.bsllsp.setup {
        -- Определяем команду, которой запускается lsp 
        cmd = {bslbinary, "lsp"}
    }

    vim.cmd([[
    nnoremap <C-b> :set syntax=bsl<CR>
    ]])
end)
