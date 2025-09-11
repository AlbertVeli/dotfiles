-- Remember last cursor position
vim.opt.shada:append('%')
vim.api.nvim_create_autocmd('BufReadPost', { command = "silent! normal! g`'" })

-- Filetype/syntax
vim.api.nvim_create_autocmd({'BufNewFile','BufReadPost'}, { pattern='*.cshtml', command='set syntax=html' })
vim.api.nvim_create_autocmd({'BufNewFile','BufRead'},     { pattern='*.objdump', command='set filetype=objdump' })

-- vim: set ts=2 sts=2 sw=2 et:
