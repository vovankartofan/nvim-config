return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.opt.cmdheight = 0
  end,
  config = function()
    local navic = require 'nvim-navic'
    require('lualine').setup {
      options = {
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
      winbar = {
        lualine_a = {
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end,
          },
        },
      },
    }
  end,
}
