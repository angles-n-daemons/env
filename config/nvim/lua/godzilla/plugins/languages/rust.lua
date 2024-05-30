local extendOptsList = require('godzilla.util.opts').extendOptsList
local extendOptsTable = require('godzilla.util.opts').extendOptsTable

local parsers = { 'ron', 'rust', 'toml' }
local tools = {
  'rust-analyzer',
  'rustfmt',
}
local formattersByFiletype = {
  ['rust'] = { 'rustfmt' },
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
      'rouge8/neotest-rust',
    },
    opts = function(_, opts)
      adapter = require 'neotest-rust'
      extendOptsList('adapters', { adapter })(_, opts)
    end,
  },
}
