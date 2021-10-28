local packer = require('packer')
packer.use({ 'SirVer/ultisnips' })
packer.use({ 'quangnguyen30192/cmp-nvim-ultisnips' })

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

-- Complextras.nvim configuration
vim.api.nvim_set_keymap(
  "i",
  "<C-x><C-m>",
  [[<c-r>=luaeval("require('complextras').complete_matching_line()")<CR>]],
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<C-x><C-d>",
  [[<c-r>=luaeval("require('complextras').complete_line_from_cwd()")<CR>]],
  { noremap = true }
)

local cmp = require "cmp"

 cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
   mapping = {
     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
     ["<C-f>"] = cmp.mapping.scroll_docs(4),
     ["<C-e>"] = cmp.mapping.close(),
     ["<c-y>"] = cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Insert,
       select = true,
     },
 
     ["<c-space>"] = cmp.mapping.complete(),
 
   },
 
   sources = {
     { name = "nvim_lsp" },
     { name = "path" },
     { name = "ultisnips" },
     { name = "buffer", keyword_length = 3, opts = { keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%([\-.]\w*\)*\|[а-яА-ЯеёЕЁ]*\)]]}},
   }, 
 
   experimental = {
     -- I like the new menu better! Nice work hrsh7th
     native_menu = false,
 
     -- Let's play with this for a day or two
     ghost_text = true,
   },
 }

