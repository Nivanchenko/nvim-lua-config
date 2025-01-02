
-- Бинды

vim.cmd([[

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" Cursor lines
:nnoremap H :set cursorline! cursorcolumn!<CR>

"Mouse
:nmap <LeftMouse> <nop>
:imap <LeftMouse> <nop>
:vmap <LeftMouse> <nop>

:nmap <2-LeftMouse> <nop>
:imap <2-LeftMouse> <nop>
:vmap <2-LeftMouse> <nop>

:map <leader>c "+y
:map <leader>v "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :sp .<CR> :terminal<CR>
map <Leader>tv :vs .<CR> :terminal<CR>

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

vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = 0 })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = 0 })
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { buffer = 0 })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("i", "<C-l>", "<C-^>")

-- Прочие настройки

vim.cmd([[

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

set scrolloff=4

set diffopt=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

set number
set relativenumber

set laststatus=2
set noshowmode

highlight lCursor guifg=NONE guibg=Cyan

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

]])


vim.keymap.set('n', 'J', '<cmd>Lspsaga code_action<CR>') 
