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
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- save file
map({ 'x', 'n', 's' }, '<C-w>', '<cmd>w<cr><esc>', { desc = 'Save File' })
-- close buffer
map({ 'i', 'x', 'n', 's' }, '<C-q>', '<Cmd>bp<bar>sp<bar>bn<bar>bd<CR>', { desc = 'Close Buffer' })
-- close window
map({ 'i', 'x', 'n', 's' }, '<C-c>', '<cmd>q<cr><esc>', { desc = 'Close Window' })

-- stylua: ignore start

-- toggle options
map("n", "<leader>ul", '<Cmd>number!<cr>', { desc = "Toggle Line Numbers" })
