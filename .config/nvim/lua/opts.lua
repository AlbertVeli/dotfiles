vim.o.background = 'dark' -- dark or light, toggle with <leader>bg
vim.g.gruvbox_contrast_light = 'soft'
pcall(vim.cmd.colorscheme, 'gruvbox')

-- Don't persist buffer list
vim.opt.shada:remove('%')
-- Clear jump list on startup
vim.api.nvim_create_autocmd('VimEnter', { command = 'clearjumps' })

-- yank to system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.fixendofline = false
vim.g.netrw_dirhistmax = 0
vim.opt.modeline = true
vim.g.python_highlight_all = 1

-- Indentation (kernel style)
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- vim: set ts=2 sts=2 sw=2 et:
