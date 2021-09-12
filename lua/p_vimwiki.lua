local packer = require('packer')

packer.use(
    { 'vimwiki/vimwiki' }
)

pcall(function()
    vim.cmd(
    [[ 
	let g:vimwiki_list = [{'path': '~/Documents/wiki/', 'path_html': '~/Documents/wiki/html/'}]
    ]])
end)
