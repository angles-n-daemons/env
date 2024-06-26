local extendOptsList = require('godzilla.util.opts').extendOptsList
local extendOptsTable = require('godzilla.util.opts').extendOptsTable
local wRepl = require('godzilla.util.terminal').wRepl

local parsers = { 'lua', 'luadoc', 'luap' }
local tools = { 'stylua', 'lua-language-server' }
local formattersByFiletype = { ['lua'] = { 'stylua' } }

return {
  -- add treesitter filetypes which will not autoinstall
  {
    'nvim-treesitter/nvim-treesitter',
    opts = extendOptsList('ensure_installed', parsers),
  },

  -- required plugins for lua development
  {
    'williamboman/mason.nvim',
    opts = extendOptsList('ensure_installed', tools),
  },

  -- add formatting settings
  {
    'stevearc/conform.nvim',
    opts = extendOptsTable('formatters_by_ft', formattersByFiletype),
  },

  -- add repl settings
  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<leader>rr', wRepl 'lua', desc = '[R]un [R]epl' },
    },
  },
}
