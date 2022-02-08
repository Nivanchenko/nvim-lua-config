local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local execute = vim.api.nvim_command

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
cmd('packadd packer.nvim')

require('settings')
require('mappings')

require('core_plugins')
require('p_lightline')
require('p_gruvbox')
require('p_delimitmate')
require('p_telescope')
require('p_easyalign')
require('p_easymotion')
-- require('p_vimspector')
require('p_vimwiki')

require('p_bsl')

--require('completion')
