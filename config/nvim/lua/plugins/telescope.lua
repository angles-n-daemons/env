local telescope = require('plugins.util.telescope')

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  cmd = 'Telescope',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
  },
  keys = {
    { '<C-f>',     telescope('live_grep'),                              desc = 'Grep (Root Dir)' },
    { '<C-p>',     telescope('find_files'),                             desc = 'Find Files (Root Dir)' },
    { '<leader>C', telescope('colorscheme', { enable_preview = true }), desc = 'Colorscheme with Preview' },
    {
      '<leader>,',
      '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>',
      desc = 'Switch Buffer',
    },
    { '<leader>sh', '<cmd>Telescope command_history<cr>',                        desc = 'Command History' },
    { '<leader>sc', telescope('find_files', { cwd = vim.fn.stdpath('config') }), desc = 'Find Config File' },
    { '<leader>?',  '<cmd>Telescope current_buffer_fuzzy_find<cr>',              desc = 'Buffer' },
    { '<leader>sC', '<cmd>Telescope commands<cr>',                               desc = 'Commands' },
    { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>',                    desc = 'Document Diagnostics' },
    { '<leader>sD', '<cmd>Telescope diagnostics<cr>',                            desc = 'Workspace Diagnostics' },
    { '<leader>sH', telescope('find_files', { hidden = true }),                  desc = 'Workspace Diagnostics' },
  },
  init = function()
    require('telescope').setup({})
  end
}
