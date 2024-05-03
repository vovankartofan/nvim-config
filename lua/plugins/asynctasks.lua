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
          '<leader>ts',
          function()
            require('telescope').extensions.asynctasks.all()
          end,
          desc = '[S]how all tasks',
        },
      },
    },
  },
  config = function()
    vim.g.asynctasks_term_pos = 'bottom'
    vim.g.asynctasks_config_name = '.nvim/tasks.ini'
    vim.g.asynctasks_term_focus = false
    vim.api.nvim_set_keymap('n', '<leader>tb', ':AsyncTask build<CR>', { desc = '[B]uild', noremap = true, silent = true })
  end,
}
