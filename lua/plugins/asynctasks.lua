return {
  'skywind3000/asynctasks.vim',
  dependencies = {
    'skywind3000/asyncrun.vim',
    {
      'GustavoKatel/telescope-asynctasks.nvim',
      dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
      },
      opts = {},
      keys = {
        {
          '<leader>ft',
          function()
            require('telescope').extensions.asynctasks.all()
          end,
          desc = 'Show all tasks.',
        },
      },
    },
  },
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>bb', ':AsyncTask build<CR>', { noremap = true, silent = true })
  end,
}
