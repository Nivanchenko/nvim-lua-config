local packer = require('packer')

packer.use(
{ 'junegunn/vim-easy-align' }
)

pcall(function()
    vim.cmd([[

    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    ]])
end)
