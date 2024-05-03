return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup {
      symbol_in_winbar = {
        enable = false,
      },
    }
  end,
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '<F2>',
      ':Lspsaga rename<CR>',
      desc = 'Rename symbol',
    },
    {
      '<F12>',
      ':Lspsaga goto_definition<CR>',
      desc = 'Go to definition',
    },
    {
      '<leader>cr',
      ':Lspsaga finder<CR>',
      desc = '[R]eferences of the symbol',
    },
    {
      '<leader>ca',
      ':Lspsaga code_action<CR>',
      desc = '[C]ode action',
    },
    {
      '<leader>cci',
      ':Lspsaga incoming_calls<CR>',
      desc = '[I]ncoming [C]alls',
    },
    {
      '<leaeer>cci',
      ':Lspsaga outgoing_calls<CR>',
      desc = '[O]utgoing [C]alls',
    },
    {
      '<leader>ci',
      ':Lspsaga finder imp<CR>',
      desc = 'Find [i]mplementation',
    },
  },
}
