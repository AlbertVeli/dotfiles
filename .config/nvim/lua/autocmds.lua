-- Remember last cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Filetype/syntax
vim.api.nvim_create_autocmd({'BufNewFile','BufReadPost'}, { pattern='*.cshtml', command='set syntax=html' })
vim.api.nvim_create_autocmd({'BufNewFile','BufRead'},     { pattern='*.objdump', command='set filetype=objdump' })

-- vim: set ts=2 sts=2 sw=2 et:
