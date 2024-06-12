return {
  'folke/trouble.nvim',
  cmd = { 'TroubleToggle', 'Trouble' },
  opts = { use_diagnostic_signs = true },
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
    { '<leader>xp', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
    { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
    {
      '<leader>cS',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP references/definitions/... (Trouble)',
    },
    { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
    { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    -- { '[q', troublePrev, desc = 'Previous Trouble/Quickfix Item' },
    -- { ']q', troubleNext, desc = 'Next Trouble/Quickfix Item' },
  },
}
