local filetypes = { 'lua' }
local tools = { 'stylua' }
local formattersByFiletype = { ['lua'] = { 'stylua' } }

return {
  ft = filetypes,

  -- add treesitter filetypes which will not autoinstall
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'lua',
        'luadoc',
        'luap',
      },
    },
  },

  -- required plugins for lua development
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
}
