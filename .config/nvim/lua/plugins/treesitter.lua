return {
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    opts = {
      ensure_installed = { 'c', 'cpp', 'lua', 'python', 'bash', 'json', 'yaml' },
      highlight = { enable = true },
      indent    = { enable = true },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
  },
}

-- vim: set ts=2 sts=2 sw=2 et
