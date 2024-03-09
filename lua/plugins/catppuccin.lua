return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'frappe',
    }

    vim.cmd.colorscheme 'catppuccin' -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
}
