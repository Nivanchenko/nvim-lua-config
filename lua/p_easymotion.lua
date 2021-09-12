local packer = require('packer')

packer.use(
{ 'easymotion/vim-easymotion' }
)

pcall(function()
    vim.cmd([[
    map <leader><leader>. <Plug>(easymotion-repeat)
    map <leader><leader>f <Plug>(easymotion-overwin-f)
    map <leader><leader>j <Plug>(easymotion-overwin-line)
    map <leader><leader>k <Plug>(easymotion-overwin-line)
    map <leader><leader>w <Plug>(easymotion-overwin-w)
    map <Leader><Leader>l <Plug>(easymotion-lineforward)
    map <Leader><Leader>h <Plug>(easymotion-linebackward)
    ]])
end)
