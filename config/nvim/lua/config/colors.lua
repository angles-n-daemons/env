-- https://github.com/neovim/neovim/issues/28927
-- some colorschemes require manual setting of termguicolors
vim.cmd 'set termguicolors'

if LANGUAGE == 'python' then
  vim.cmd 'colorscheme gruvbox'
elseif LANGUAGE == 'typescript' then
  vim.cmd 'colorscheme tokyonight'
elseif LANGUAGE == 'go' then
  -- TODO: find colorscheme
elseif LANGUAGE == 'c' then
  -- TODO: find colorscheme
elseif LANGUAGE == 'lua' then
  -- TODO: find colorscheme
end
