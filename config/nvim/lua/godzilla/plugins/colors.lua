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
  go = { 'rebelot/kanagawa.nvim', config = setColorScheme 'kanagawa' },
  typescript = { 'catppuccin/nvim', name = 'catppuccin', config = setColorScheme 'catppuccin' },
  lua = { 'folke/tokyonight.nvim', config = setColorScheme 'tokyonight' },
  cpp = { 'zortax/three-firewatch', config = setColorScheme 'three-firewatch' },
}
local colorConfigsList = {
  colorConfigs.default,
  colorConfigs.python,
  colorConfigs.go,
  colorConfigs.typescript,
  colorConfigs.lua,
  colorConfigs.cpp,
}
-- additional colorschemes
-- melange
-- PaperColor
-- okcolors
-- miikanissi/modus-themes.nvim

-- local color = colorConfigs[SETTINGS.language] or colorConfigs.default

-- new approach, choose a color at random
math.randomseed(os.time())
local color = colorConfigsList[math.random(#colorConfigsList)]
color.lazy = false
color.priority = 1000

return {
  color,
}
