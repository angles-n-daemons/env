--[[ AUTOCMDS ]]
-- set cursorline when entering and leaving windows
local function setActivePaneLines(line, column)
  return function()
    vim.wo.cursorline = line
    vim.opt.colorcolumn = column
  end
end
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  callback = setActivePaneLines(true, '80'),
})
vim.api.nvim_create_autocmd({ 'BufLeave' }, {
  callback = setActivePaneLines(false, ''),
})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('close_with_q', { clear = true }),
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'notify',
    'qf',
    'query',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})
