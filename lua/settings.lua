vim.cmd([[

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Removes pipes | that act as seperators on splits
"set fillchars+=vert:\

set scrolloff=4

set diffopt=vertical

set path+=**

" Display all matching files when we tab complete
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

hi Normal guibg=NONE ctermbg=NONE

set number
set relativenumber
highlight LineNr ctermfg=grey

set laststatus=2
set noshowmode

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-l> <C-^>
highlight lCursor guifg=NONE guibg=Cyan

:set mouse=n

let python_highlight_all=1

]])
