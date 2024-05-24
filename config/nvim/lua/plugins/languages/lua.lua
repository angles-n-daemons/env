local extendOptsList = require('plugins.languages.util').extendOptsList

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
    opts = extendOptsList('formatters_by_ft', formattersByFiletype),
  },
}
