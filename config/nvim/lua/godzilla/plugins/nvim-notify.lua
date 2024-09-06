return {
  'rcarriga/nvim-notify',
  keys = {
    {
      '<leader>nd',
      function()
        require('notify').dismiss()
      end,
      desc = '[N]otification [D]ismiss',
    },
    {
      '<leader>np',
      function()
        vim.notify(vim.api.nvim_buf_get_name(0))
      end,
      desc = '[N]otification current [P]ath',
    },
  },
  config = function()
    vim.notify = require 'notify'
  end,
}
