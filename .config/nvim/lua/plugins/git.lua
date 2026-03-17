return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = { add = {text='+'}, change = {text='~'}, delete = {text='-'} },
    },
    config = function(_, opts)
      require('gitsigns').setup(opts)
    end,
  },
  -- Optional: { 'tpope/vim-fugitive' },
}

-- vim: ts=2 sts=2 sw=2 et
