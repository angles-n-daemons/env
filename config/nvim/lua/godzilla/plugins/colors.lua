-- colorschemes chosen have light and dark colorschemes
-- they often have highlight groups for a variety of nvim plugins like dap, lualine, etc

local function setColorScheme(name)
  return function()
    vim.cmd('colorscheme ' .. name)
  end
end

local colorConfigs = {
  default = { 'neanias/everforest-nvim', config = setColorScheme 'everforest' },
  python = { 'ellisonleao/gruvbox.nvim', config = setColorScheme 'gruvbox' },
  go = { 'zortax/three-firewatch', config = setColorScheme 'three-firewatch' },
  typescript = { 'catppuccin/nvim', name = 'catppuccin', config = setColorScheme 'catppuccin' },
  lua = { 'folke/tokyonight.nvim', config = setColorScheme 'tokyonight' },
  cpp = { 'rebelot/kanagawa.nvim', config = setColorScheme 'kanagawa' },
}
-- additional colorschemes
-- melange
-- PaperColor
-- okcolors
-- miikanissi/modus-themes.nvim

local color = colorConfigs[SETTINGS.language] or colorConfigs.default
color.lazy = false
color.priority = 1000

return {
  color,
}
