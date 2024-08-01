local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

require("lazy").setup({


  "wbthomason/packer.nvim",

-- Цветовая схема
  "sainnhe/everforest",

-- Ништяки для 1С и OneScript
  "ava57r/vim-language-1c-bsl",

-- Украшения
  "ryanoasis/vim-devicons",

-- Управление LS и тд.
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
        ui =  {
               code_action = ''
              }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
    }},

-- Автокомплит
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-omni",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",

-- Отладчик
  "nvim-treesitter/nvim-treesitter",
  "nvim-neotest/nvim-nio",
  "mfussenegger/nvim-dap",
  "ldelossa/nvim-dap-projects",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-lua/plenary.nvim",

-- rust
  {"mrcjkb/rustaceanvim",
  version = '^4', -- Recommended
  ft = { 'rust' }},

-- Файловый Менеджер
  {
      "stevearc/oil.nvim",
      config = function()
        require("oil").setup()
      end,
  },

-- Telescope
     {'nvim-telescope/telescope.nvim',
       requires = { {'nvim-lua/plenary.nvim'} }
     },

-- utility
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup { }
    end
  }
})

-- Настройка цветовой схемы.
vim.cmd [[
    set background=dark
    let g:everforest_background = 'soft'
    let g:everforest_better_performance = 1
    colorscheme everforest
]]

-- установка русской раскладки
vim.cmd [[
	set keymap=russian-jcukenwin
	set iminsert=0
	set imsearch=0
]]

-- Настройки lsp
require("mason").setup()
require("mason-lspconfig").setup { ensure_installed = { "bsl_ls" } }

require("mason-lspconfig").setup_handlers {
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        ["bsl_ls"] = function ()
            require'lspconfig'.bsl_ls.setup {
                root_dir = function(fname)
                               local util = require 'lspconfig/util'
                               return util.find_git_ancestor(fname) or util.path.dirname(fname)
                           end,
                cmd = {vim.fn.stdpath('data') .. "/mason/bin/bsl-language-server", "lsp"}
            }
        end
}

-- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    event = "InsertEnter",
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'buffer', keyword_length = 3, option = { keyword_pattern =  [[\<[a-zA-Zа-яА-ЯёЁ0-9]\+\>]] } },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'vsnip' } 
      })
  })
  

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Настройки отладчика оскрипта
require("dapui").setup()


local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<F9>", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
vim.keymap.set("n", "<F5>", ':DapContinue<CR>')
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

dap.adapters.bsl = {
  id = 'oscript';
  type = 'executable';
  command = 'mono'; 
  args = {"/Users/n.ivanchenko/.vscode/extensions/evilbeaver.oscript-debug-0.8.0/bin/VSCode.DebugAdapter.exe"};
  name = 'bsl';
}

dap.configurations.bsl = {
  {
    type = 'bsl';
    request = 'launch';
    name = "Отладка 1Script";
    program = "${file}";
    cwd = '${workspaceFolder}';
    args = {};
    -- env = {};
    runtimeExecutable = "/Users/n.ivanchenko/.local/share/ovm/OS20/oscript";
    runtimeArgs = {};
    debugPort = 2801;
  }
}

 require("nvim-dap-virtual-text").setup()

-- Бинды

vim.cmd([[

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

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

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

hi Normal guibg=NONE ctermbg=NONE

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

require("rust")
require("bsl")

vim.keymap.set('n', 'J', '<cmd>Lspsaga code_action<CR>') 
