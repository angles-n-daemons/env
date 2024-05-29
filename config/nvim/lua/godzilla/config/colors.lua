-- https://github.com/neovim/neovim/issues/28927
-- some colorschemes require manual setting of termguicolors
vim.cmd 'set termguicolors'

local color = 'three-firewatch'
if LANGUAGE == 'python' then
  color = 'gruvbox'
elseif LANGUAGE == 'typescript' then
  color = 'catppuccin'
elseif LANGUAGE == 'go' then
  color = 'three-firewatch'
elseif LANGUAGE == 'c' then
  color = 'modus'
end

vim.cmd('colorscheme ' .. color)
