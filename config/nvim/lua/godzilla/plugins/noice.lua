return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>nl', ':Noice last', desc = '[N]oice, [L]ast' },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function(_, opts)
    require('noice').setup(opts)
  end,
}
