
return {
  "sainnhe/everforest",
  init = function()
    vim.cmd [[
      set background=dark
      let g:everforest_background = 'soft'
      let g:everforest_better_performance = 1
      colorscheme everforest
      ]]
   end,
 }
