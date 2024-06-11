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
  },
  config = function()
    vim.notify = require 'notify'
  end,
}
