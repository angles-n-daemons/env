return {
  'rcarriga/nvim-notify',
  config = function()
    print 'starting notify'
    vim.notify = require 'notify'
  end,
}
