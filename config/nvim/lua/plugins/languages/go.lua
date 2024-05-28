local extendOptsList = require('util.opts').extendOptsList
local extendOptsTable = require('util.opts').extendOptsTable

local parsers = { 'go', 'gomod', 'gosum', 'gotmpl', 'gowork' }
local tools = {
  'gopls',
  'delve',
  'goimports',
}
local formattersByFiletype = {
  ['go'] = { 'goimports' },
}

return {
  -- add treesitter filetypes which will not autoinstall
  {
    'nvim-treesitter/nvim-treesitter',
    optional = true,
    opts = extendOptsList('ensure_installed', parsers),
  },

  -- required plugins for development
  {
    'williamboman/mason.nvim',
    optional = true,
    opts = extendOptsList('ensure_installed', tools),
  },

  -- add formatting settings
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = extendOptsTable('formatters_by_ft', formattersByFiletype),
  },

  -- add testing settings
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/neotest-go',
    },
    opts = function(_, opts)
      local adapter = require 'neotest-go' {
        recursive_run = true,
      }
      extendOptsList('adapters', { adapter })(_, opts)
    end,
  },

  -- debug adapter configuration
  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      'leoluz/nvim-dap-go',
      config = true,
    },
    config = function()
      require('dap-go').setup {
        dap_configurations = {
          {
            type = 'go',
            name = 'Debug main.go',
            request = 'launch',
            program = '${workspaceFolder}/cmd/main.go',
          },
        },
      }
    end,
  },
}
