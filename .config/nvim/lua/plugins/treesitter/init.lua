local function toggleContext()
  local tsc = require('treesitter-context')
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
      highlight = {
        enable = true,
      },
    },

    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
    },
    config = function(_, _)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["if"] = "@function.inner",
              ["af"] = "@function.outer",
              ["ic"] = "@class.inner",
              ["ac"] = "@class.outer",
              ["ib"] = "@block.inner",
              ["ab"] = "@block.outer",
            }
          },
          move = {
            enable = true,
            keymaps = {
              ["if"] = "@function.inner",
              ["af"] = "@function.outer",
              ["ic"] = "@class.inner",
              ["ac"] = "@class.outer",
              ["ib"] = "@block.inner",
              ["ab"] = "@block.outer",
            }
          },
        },
      })
      -- what are the things that I want to try to configure
      -- lazyvim seems to have a number of overrides:
      --  - lots of languages ensure installed
      --  - incremental selection
      --  - text object configuration

      -- What will I use treesitter for?
      -- - syntax highlighting (ideally beyond the lsp?)
      -- - text objects
      -- - possible lsp interop
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
    end
  }
}
