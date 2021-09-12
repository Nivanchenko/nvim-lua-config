local packer = require('packer')

packer.use(
    { 'morhetz/gruvbox' }
)

pcall(function()
    vim.cmd(
    [[ 
    colorscheme gruvbox 
    set background=dark 
    ]])
end)
