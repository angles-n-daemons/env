local extendOptsList = require('godzilla.util.opts').extendOptsList
local extendOptsTable = require('godzilla.util.opts').extendOptsTable

local parsers = { 'go', 'gomod', 'gosum', 'gotmpl', 'gowork' }
local tools = {
  'gopls',
  'delve',
  'crlfmt',
  'buf',
}
local formattersByFiletype = {
  ['go'] = { 'crlfmt' },
  ['proto'] = { 'buf' },
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
      'nvim-neotest/neotest-golang',
    },
    opts = function(_, opts)
      local adapter = require 'neotest-golang' {}
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
      require('dap-go').setup {}
    end,
  },
}
