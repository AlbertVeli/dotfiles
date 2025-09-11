return {
  -- Telescope + fzf
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    config = function() pcall(require('telescope').load_extension, 'fzf') end,
  },

  -- Copilot
  { 'github/copilot.vim' },

  -- Icons
  {
    'echasnovski/mini.icons',
    version = false, lazy = false, priority = 1000, main = 'mini.icons',
    opts = { style = 'glyph' },
    config = function(_, opts)
      require('mini.icons').setup(opts)
      require('mini.icons').mock_nvim_web_devicons()
    end,
  },

  -- Oil
  { 'stevearc/oil.nvim', opts = {}, lazy = false },
}

-- vim: set ts=2 sts=2 sw=2 et
