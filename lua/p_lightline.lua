local packer = require('packer')

packer.use(
    { 'itchyny/lightline.vim' }
)


pcall(function()
    vim.cmd([[
    let g:lightline = { 'colorscheme': 'seoul256', 'active': { 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified', 'keymap' ] ] }, 'component_function': { 'keymap': 'LightLineKeymap' }, }

    function! LightLineKeymap()
        let km = &iminsert == 0 ? 'en' : 'ru'
        call lightline#update()
        return km
    endfunction
    ]])

end)
