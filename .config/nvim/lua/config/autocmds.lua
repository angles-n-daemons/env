-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--[[ AUTOCMDS ]]
-- set cursorline when entering and leaving windows
local function setActivePaneLines(line, column)
  return function()
    vim.wo.cursorline = line
    vim.opt.colorcolumn = column
  end
end
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = setActivePaneLines(true, "80"),
})
vim.api.nvim_create_autocmd({ "BufLeave" }, {
  callback = setActivePaneLines(true, ""),
})
