return {
  'akinsho/bufferline.nvim',
  event = 'VimEnter',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = '[B]uffer [P]in' },
    { '<leader>bo', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
  },
  opts = {
    options = {
      always_show_bufferline = true,
    },
  },
  config = function(_, opts)
    vim.cmd 'set termguicolors'
    require('bufferline').setup(opts)
  end,
}
