local extendOptsList = require('godzilla.util.opts').extendOptsList
local extendOptsTable = require('godzilla.util.opts').extendOptsTable

local parsers = { 'c', 'cpp', 'make' }
local tools = {
  'clangd',
  'codelldb',
  'cpplint',
  'clang-format',
}
local formattersByFiletype = {
  ['c'] = { 'clang-format' },
  ['cpp'] = { 'clang-format' },
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

  -- debug adapter configuration
  {
    'mfussenegger/nvim-dap',
    optional = true,
    opts = function()
      local dap = require 'dap'
      if not dap.adapters['cppdbg'] then
        require('dap').adapters['cppdbg'] = {
          type = 'server',
          host = '127.0.0.1', -- localhost doesn't work on mac
          port = '${port}',
          executable = {
            command = 'codelldb',
            args = {
              '--port',
              '${port}',
            },
          },
        }
      end
    end,
  },
}
