return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      { 'rcarriga/nvim-dap-ui', opts = {} },
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      local code = require 'dap.ext.vscode'

      require('mason').setup {
        ui = {
          border = 'rounded',
        },
      }

      require('mason-nvim-dap').setup {
        automatic_installation = true,
        ensure_installed = {
          'python',
          'cppdbg',
          'codelldb',
          'dart',
        },
        handlers = {},
      }

      dap.listeners.before.attach.dapui_config = function()
        require('neo-tree.sources.manager').close_all()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        require('neo-tree.sources.manager').close_all()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      require('nvim-dap-virtual-text').setup {}
      local launchJsConfig = {
        codelldb = { 'c', 'cpp' },
        cppdbg = { 'c', 'cpp' },
        cppvsdbg = { 'c', 'cpp' },
      }
      code.load_launchjs(nil, launchJsConfig)
      vim.keymap.set('n', '<F5>', function()
        -- (Re-)reads launch.json if present
        if vim.fn.filereadable '.vscode/launch.json' then
          code.load_launchjs(nil, launchJsConfig)
        end
        require('dap').continue()
      end)
      vim.keymap.set('n', '<F10>', function()
        require('dap').step_over()
      end)
      vim.keymap.set('n', '<F11>', function()
        require('dap').step_into()
      end)
      vim.keymap.set('n', '<F12>', function()
        require('dap').step_out()
      end)
      vim.keymap.set('n', '<Leader>dr', function()
        require('dap').repl.open()
      end)

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text = ' ', texthl = 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text = ' ', texthl = 'DapStopped' })
    end,
  },
}
