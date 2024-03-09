local function close_neo_tree()
  require('neo-tree.sources.manager').close_all()
  require('dapui').close()
end

local function open_neo_tree()
  require('neo-tree.sources.manager').show 'filesystem'
end

return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Starter screen
    require('mini.starter').setup()

    vim.opt.sessionoptions:append 'globals'
    -- Session management
    require('mini.sessions').setup {
      -- Whether to read latest session if Neovim opened without file arguments
      autoread = true,

      -- Whether to write current session before quitting Neovim
      autowrite = true,

      -- File for local session (use `''` to disable)
      file = '.nvim/session.vim',
      directory = './.nvim/',

      -- Whether to force possibly harmful actions (meaning depends on function)
      force = { read = false, write = true, delete = false },

      -- Hook functions for actions. Default `nil` means 'do nothing'.
      hooks = {
        -- Before successful action
        pre = {
          read = nil,
          write = function()
            close_neo_tree()
            vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
          end,
          delete = nil,
        },
        -- After successful action
        post = { read = open_neo_tree, write = nil, delete = nil },
      },

      -- Whether to print session path after action
      verbose = { read = false, write = true, delete = true },
    }

    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        vim.cmd [[:mksession! .nvim/session.vim]]
      end,
      pattern = '*',
    })

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
