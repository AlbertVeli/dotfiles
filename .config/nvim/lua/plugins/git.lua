return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = { add = {text='+'}, change = {text='~'}, delete = {text='-'} },
    },
    config = function(_, opts)
      require('gitsigns').setup(opts)
      local gs = package.loaded.gitsigns
      vim.keymap.set('n','<leader>gp', gs.preview_hunk, { desc='Git preview hunk' })
      vim.keymap.set('n','<leader>gb', gs.blame_line,  { desc='Git blame line' })
    end,
  },
  -- Optional: { 'tpope/vim-fugitive' },
}

-- vim: ts=2 sts=2 sw=2 et
