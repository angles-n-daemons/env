local function harpoonList()
  local harpoon = require 'harpoon'
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

local function harpoonAdd()
  require('harpoon'):list():add()
end

local function harpoonSelect(i)
  return function()
    require('harpoon'):list():select(i)
  end
end

local function harpoonNext()
  require('harpoon'):list():next()
end

local function harpoonPrev()
  require('harpoon'):list():prev()
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ha', harpoonAdd, desc = '[H]arpoon [A]dd' },
    { '<leader>hl', harpoonList, desc = '[H]arpoon [L]ist' },
    { '<leader>h1', harpoonSelect(1), desc = 'Jump to [1]st window' },
    { '<leader>h1', harpoonSelect(1), desc = 'Jump to [1]st window' },
    { '<leader>h2', harpoonSelect(2), desc = 'Jump to [2]nd window' },
    { '<leader>h3', harpoonSelect(3), desc = 'Jump to [3]rd window' },
    { '<leader>h4', harpoonSelect(4), desc = 'Jump to [4]the window' },
    -- The below do not work on osx
    { '<C-S-N>', harpoonNext, desc = 'Harpoon [N]ext' },
    { '<C-S-P>', harpoonPrev, desc = 'Harpoon [P]rev' },
  },
}
