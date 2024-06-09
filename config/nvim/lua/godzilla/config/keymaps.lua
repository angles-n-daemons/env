--[[ MAP ]]
local map = vim.keymap.set

-- remap semicolon to colon
map('n', ';', ':')

-- toggle background mapping
local toggleBg = function()
  vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'
end
map('n', '<C-g>', toggleBg, { desc = 'Toggle Background' })

-- Show messages
map('n', '<leader>m', '<cmd>messages<cr>', { desc = 'Show Messages' })

-- command line movement remapping
map('c', '<C-h>', '<S-Left>', { desc = '[Cmd] Jump Left' })
map('c', '<C-l>', '<S-Right>', { desc = '[Cmd] Jump Right' })

-- clear hlsearch
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear Highlight Search' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- better up down functionality
map({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

-- resize window using <ctrl> arrow keys
map('n', '_', '<cmd>resize -5<cr>', { desc = 'Decrease Window Height' })
map('n', '+', '<cmd>resize +5<cr>', { desc = 'Increase Window Height' })
map('n', '-', '<cmd>vertical resize -10<cr>', { desc = 'Decrease Window Width' })
map('n', '=', '<cmd>vertical resize +10<cr>', { desc = 'Increase Window Width' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- save file
map({ 'x', 'n', 's' }, '<C-w>', '<cmd>w<cr><esc>', { desc = 'Save File' })
-- close buffer
local function countListedBuffers()
  local bufs = vim.api.nvim_list_bufs()
  local loadedCount = 0
  for i = 1, #bufs do
    if vim.fn.getbufinfo(bufs[i])[1].listed == 1 then
      loadedCount = loadedCount + 1
    end
  end
  return loadedCount
end
local function closeBuffer()
  local hasNextBuffer = countListedBuffers() > 0
  local bufferModified = vim.api.nvim_get_option_value('modified', { buf = 0 })

  if bufferModified then
    require 'notify'('Buffer is unsaved', 'error', { title = 'Error' })
  elseif hasNextBuffer then
    vim.cmd 'bp | sp | bn | bd'
  else
    vim.cmd 'bd'
  end
end
map({ 'i', 'x', 'n', 's' }, '<C-q>', closeBuffer, { desc = 'Close Buffer' })
-- force close buffer
map({ 'n', 's' }, '<C-x>', '<cmd>bd!<cr>', { desc = 'Force Close Buffer' })
-- close window
map({ 'i', 'x', 'n', 's' }, '<C-c>', '<cmd>q<cr><esc>', { desc = 'Close Window' })


-- stylua: ignore start

-- toggle options
map("n", "<leader>ul", '<Cmd>number!<cr>', { desc = "Toggle Line Numbers" })
