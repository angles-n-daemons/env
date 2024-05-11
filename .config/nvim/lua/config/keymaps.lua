-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--[[ MAP ]]
-- mapping function helpers
local function map(mode, from, to)
  vim.keymap.set(mode, from, to, { noremap = true })
end

local function nmap(from, to)
  map("n", from, to)
end

local function cmap(from, to)
  map("", from, to)
end

-- remap semicolon to colon
vim.keymap.set("n", ";", ":")

-- toggle background mapping
vim.background = "dark"
local toggleBg = function()
  vim.background = vim.background == "dark" and "light" or "dark"
end
nmap("<C-G>", toggleBg)

-- command line movement remapping
vim.keymap.set("c", "<C-H>", "<S-Left>")
vim.keymap.set("c", "<C-L>", "<S-Right>")
