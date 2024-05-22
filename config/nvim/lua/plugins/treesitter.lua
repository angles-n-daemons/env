local function toggleContext()
  local tsc = require 'treesitter-context'
  tsc.toggle()
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    opts = {
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ['if'] = '@function.inner',
            ['af'] = '@function.outer',
            ['ic'] = '@class.inner',
            ['ac'] = '@class.outer',
            ['ib'] = '@block.inner',
            ['ab'] = '@block.outer',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']f'] = '@function.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<cr>',
          node_incremental = '.',
          node_decremental = ',',
          scope_incremental = 'grc',
        },
      },
    },

    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
    },
    config = function(_, opts)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'WinEnter',
    enabled = true,
    opts = { mode = 'cursor', max_lines = 10 },
    keys = {
      {
        '<leader>ut',
        toggleContext,
        desc = 'Toggle Treesitter Context',
      },
    },
    config = function()
      require('treesitter-context').enable()
    end,
  },
}
