local extendOptsList = require('plugins.languages.util').extendOptsList

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

  -- required plugins for typescript development
  {
    'williamboman/mason.nvim',
    optional = true,
    opts = extendOptsList('ensure_installed', tools),
  },

  -- add formatting settings
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = extendOptsList('formatters_by_ft', formattersByFiletype),
  },

  -- add testing settings
  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = {
      'nvim-neotest/neotest-python',
    },
    opts = extendOptsList('adapters', { adapter }),
  },
}
