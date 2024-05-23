local filetypes = { 'lua' }
local tools = { 'stylua' }
local formattersByFiletype = { ['lua'] = { 'stylua' } }

return {
  ft = filetypes,

  -- add treesitter filetypes which will not autoinstall
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'lua',
        'luadoc',
        'luap',
      })
    end,
  },

  -- required plugins for lua development
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, tools)
    end,
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
