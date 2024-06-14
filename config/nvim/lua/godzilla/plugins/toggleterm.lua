return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    {
      '<C-t>',
      function()
        require('toggleterm').toggle()
      end,
      desc = 'Toggle Terminal',
      mode = { 'n', 't' },
    },
    {
      '<leader>rt',
      function()
        require('toggleterm').toggle()
      end,
      desc = '[R]un [T]erminal',
    },
  },
  config = true,
}
