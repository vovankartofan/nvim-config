return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  lazy = false,
  keys = {
    {
      '<leader>Rl',
      ':RustLsp runnables<CR>',
      { noremap = true, silent = true, desc = 'List of run targets' },
    },
    {
      '<leader>Dl',
      ':RustLsp debuggables<CR>',
      { noremap = true, silent = true, desc = 'List of debug targets' },
    },
    {
      '<leader>Rt',
      ':RustLsp run<CR>',
      { noremap = true, silent = true, desc = 'Run the current target' },
    },
    {
      '<leader>Dt',
      ':RustLsp debug<CR>',
      { noremap = true, silent = true, desc = 'Debug the current target' },
    },
  },
}
