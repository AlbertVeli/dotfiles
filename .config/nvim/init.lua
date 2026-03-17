-- Speed up Lua module loading
pcall(function() vim.loader.enable() end)

-- Leader early
vim.g.mapleader = ' '

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ 'git','clone','--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require('lazy').setup({ spec = { { import = 'plugins' } } })

-- Core config
require('opts')
require('autocmds')
require('keymaps')
