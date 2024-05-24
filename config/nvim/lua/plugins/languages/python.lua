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

return {
  -- add treesitter filetypes which will not autoinstall
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = filetypes,
    },
  },

  -- required plugins for typescript development
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = tools,
    },
  },

  -- add formatting settings
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = {
      formatters_by_ft = formattersByFiletype,
    },
  },

  -- add testing settings
  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = {
      'nvim-neotest/neotest-python',
    },
    opts = {
      adapters = {
        ['neotest-python'] = {
          runner = 'unittest',
        },
      },
    },
  },
}
