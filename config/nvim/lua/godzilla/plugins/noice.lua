return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>nl', '<C-n>', desc = 'nnnnnnnnn[N]oice!' },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function(_, opts)
    require('noice').setup(opts)
  end,
}
