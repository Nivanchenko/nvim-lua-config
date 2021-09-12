local packer = require('packer')

packer.use(
{ 'puremourning/vimspector' }
)

pcall(function()
    vim.cmd([[
    let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
    nnoremap <S-F5> <Plug>VimspectorRestart
    ]])
end)
