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
  typescript = { 'catppuccin', config = setColorScheme 'catppuccin' },
  lua = { 'folke/tokyonight.nvim', config = setColorScheme 'tokyonight' },
  c = { 'miikanissi/modus-themes.nvim', config = setColorScheme 'modus' },
}
-- additional colorschemes
-- melange
-- PaperColor
-- okcolors

local color = colorConfigs[CONFIG.language] or colorConfigs.default
color.lazy = false
color.priority = 1000

return {
  color,
}
