--[[ MAP ]]
local map = vim.keymap.set

-- toggle background mapping
local toggleBg = function()
  vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'
end
map('n', '<C-g>', toggleBg, { desc = 'Toggle Background' })

-- command line movement remapping
map('c', '<C-h>', '<S-Left>', { desc = '[Cmd] Jump Left' })
map('c', '<C-l>', '<S-Right>', { desc = '[Cmd] Jump Right' })

-- clear hlsearch
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear Highlight Search' })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- better up down functionality
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- resize window using <ctrl> arrow keys
map("n", "<C-=>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-->", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-,>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-.>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

require('which-key').register()
