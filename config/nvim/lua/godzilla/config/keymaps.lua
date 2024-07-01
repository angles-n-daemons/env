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
map({ 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
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
  local numListedBuffers = countListedBuffers()
  local bufferModified = vim.api.nvim_get_option_value('modified', { buf = 0 })

  if bufferModified then
    require 'notify'('Buffer is unsaved', 'error', { title = 'Error' })
  elseif numListedBuffers > 1 then
    vim.cmd 'bp | sp | bn | bd'
  elseif numListedBuffers == 1 then
    vim.cmd 'bd'
    vim.cmd 'Dashboard'
  end
end
map({ 'i', 'x', 'n', 's' }, '<C-q>', closeBuffer, { desc = 'Close Buffer' })
-- force close buffer
map({ 'n', 's' }, '<C-x>', '<cmd>bd!<cr>', { desc = 'Force Close Buffer' })

-- CTRL-C go to normal mode, or exit vim
map({ 'n' }, '<C-c>', '<cmd>q<cr><esc>', { desc = 'Close Window' })
map({ 'i', 'x', 's' }, '<C-c>', '<esc>', { desc = 'Go to Normal Mode' })


-- stylua: ignore start

-- toggle options
map("n", "<leader>ul", '<Cmd>set number!<cr>', { desc = "Toggle Line Numbers" })

-- remap <c-_> to <c-/> so I can bind <C-/>
map("n", "<c-_>", "<c-/>", { remap = true, desc = "which_key_ignore" })
map("t", "<c-_>", "<c-/>", { remap = true, desc = "which_key_ignore" })
