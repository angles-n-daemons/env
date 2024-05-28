local extendOptsList = require('util.opts').extendOptsList
local extendOptsTable = require('util.opts').extendOptsTable

local parsers = { 'python' }
local tools = {
  'pyright',
  'debugpy',
  'flake8',
  'autopep8',
}
local formattersByFiletype = {
  ['python'] = { 'autopep8' },
}
local adapter = {
  ['neotest-python'] = {
    runner = 'unittest',
  },
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
      'nvim-neotest/neotest-python',
    },
    opts = function(_, opts)
      adapter = require 'neotest-python' {
        runner = 'unittest',
      }
      extendOptsList('adapters', { adapter })(_, opts)
    end,
  },

  -- debug adapter configuration
  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      'mfussenegger/nvim-dap-python',
      config = function()
        local path = require('mason-registry').get_package('debugpy'):get_install_path()
        require('dap-python').setup(path .. '/venv/bin/python')
      end,
    },
  },
}
