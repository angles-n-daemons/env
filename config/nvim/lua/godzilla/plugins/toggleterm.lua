return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    {
      '<C-/>',
      function()
        require('toggleterm').toggle()
      end,
      desc = 'Toggle Terminal',
      mode = { 'n' },
    },
    {
      '<C-/>',
      function()
        require('toggleterm').toggle()
      end,
      desc = 'Toggle Terminal',
      mode = { 't' },
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
