return {
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        c = { 'clangtidy' }, cpp = { 'clangtidy' },
        sh = { 'shellcheck' },
        python = { 'ruff' }, -- or 'flake8'
        yaml = { 'yamllint' },
      }
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave' }, {
        callback = function() require('lint').try_lint() end,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
