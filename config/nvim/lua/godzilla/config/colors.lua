-- https://github.com/neovim/neovim/issues/28927
-- some colorschemes require manual setting of termguicolors
vim.cmd 'set termguicolors'

local color = 'modus'
if LANGUAGE == 'python' then
  color = 'gruvbox'
elseif LANGUAGE == 'typescript' then
  color = 'catppuccin'
elseif LANGUAGE == 'go' then
  color = 'three-firewatch'
elseif LANGUAGE == 'c' then
  color = 'melange'
end

vim.cmd('colorscheme ' .. color)
