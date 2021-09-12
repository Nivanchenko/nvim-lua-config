vim.cmd([[

nnoremap Q <Nop>

" Cursor lines
:nnoremap H :set cursorline! cursorcolumn!<CR>

"lang swicher
inoremap <C-l> <C-^>

"Mouse
:nmap <LeftMouse> <nop>
:imap <LeftMouse> <nop>
:vmap <LeftMouse> <nop>

:nmap <2-LeftMouse> <nop>
:imap <2-LeftMouse> <nop>
:vmap <2-LeftMouse> <nop>

:map <leader>c "+y
:map <leader>v "+p

" Buffers
nnoremap <Leader>] :bn<CR>
nnoremap <Leader>[ :bp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :sp .<CR> :term<CR>
map <Leader>vt :vs .<CR> :term<CR>

" unfocus term
tnoremap <ESC><ESC> <C-\><C-N>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

]])
