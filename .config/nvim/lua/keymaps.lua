local map = vim.keymap.set
-- Telescope via Lua, not command strings
local tb = require('telescope.builtin')
map('n','<leader>tf', tb.find_files, { desc='Telescope files' })
map('n','<leader>tg', tb.live_grep,  { desc='Telescope grep' })
map('n','<leader>tb', tb.buffers,    { desc='Telescope buffers' })
map('n','<leader>th', tb.help_tags,  { desc='Telescope help' })

-- Copilot
map('n','<leader>gc', ':Copilot panel<CR>', { silent=true, desc='Copilot panel' })
map('i','<C-J>', 'copilot#Accept("<CR>")', { expr=true, silent=true })

-- Oil
map('n','-', '<CMD>Oil<CR>', { desc='Open parent directory' })

-- Git
local gs = function() return require('gitsigns') end
vim.keymap.set('n', ']h', function() gs().next_hunk() end, { desc='Next hunk' })
vim.keymap.set('n', '[h', function() gs().prev_hunk() end, { desc='Prev hunk' })
vim.keymap.set('n', '<leader>gp', function() gs().preview_hunk() end, { desc='Preview hunk' })
vim.keymap.set('n', '<leader>gs', function() gs().stage_hunk() end, { desc='Stage hunk' })
vim.keymap.set('n', '<leader>gr', function() gs().reset_hunk() end, { desc='Reset hunk' })
vim.keymap.set('n', '<leader>gS', function() gs().stage_buffer() end, { desc='Stage buffer' })
vim.keymap.set('n', '<leader>gR', function() gs().reset_buffer() end, { desc='Reset buffer' })
vim.keymap.set('n', '<leader>gb', function() gs().blame_line() end, { desc='Blame line' })
vim.keymap.set('n', '<leader>gB', function() gs().toggle_current_line_blame() end, { desc='Toggle blame' })
vim.keymap.set('n', '<leader>gd', function() gs().diffthis() end, { desc='Diff this' })

-- Jumps in the same buffer
local function prev_jump_same_buf()
  local list, idx = unpack(vim.fn.getjumplist())
  local cur = vim.api.nvim_get_current_buf()
  for i = idx - 1, 1, -1 do
    if list[i].bufnr == cur then
      vim.cmd('normal! ' .. (idx - i) .. '<C-o>')
      return
    end
  end
end

local function next_jump_same_buf()
  local list, idx = unpack(vim.fn.getjumplist())
  local cur = vim.api.nvim_get_current_buf()
  for i = idx + 1, #list do
    if list[i].bufnr == cur then
      vim.cmd('normal! ' .. (i - idx) .. '<C-i>')
      return
    end
  end
end

vim.keymap.set('n', '<leader>jo', prev_jump_same_buf, { desc = 'Prev jump (same buffer)' })
vim.keymap.set('n', '<leader>ji', next_jump_same_buf, { desc = 'Next jump (same buffer)' })

-- Toggle background
vim.keymap.set('n','<leader>bg', function()
  vim.o.background = (vim.o.background == 'dark') and 'light' or 'dark'
  vim.cmd.colorscheme('gruvbox')
end, { desc = 'Toggle background' })

-- vim: set ts=2 sts=2 sw=2 et:
