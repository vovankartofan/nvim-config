return {
  -- Install none-ls for diagnostics, code actions, and formatting
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  dependencies = { 'mason.nvim', 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>ff',
      ':Format<cr>',
      desc = 'Format buffer',
    },
    {
      '<leader>fl',
      vim.lsp.buf.format,
      'v',
      desc = 'Format lines',
    },
  },
  config = function()
    local null_ls = require 'null-ls'

    -- Congifure LSP linting, formatting, diagnostics, and code actions
    local formatting = null_ls.builtins.formatting
    null_ls.setup {
      border = 'rounded',
      sources = {
        -- formatting
        formatting.prettierd,
        formatting.stylua,
        formatting.ocamlformat,
        formatting.clang_format,
        formatting.cmake_format,
      },
    }
  end,
}
