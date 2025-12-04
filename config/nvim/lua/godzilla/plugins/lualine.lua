local isBuildRunning = require('godzilla.jobs.build-status').isBuildRunning
local buildSpinner = require 'godzilla.util.spinner' 'BUILDING'
local goplsMemory = require('godzilla.jobs.gopls-memory')

return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function(_, opts)
    require('lualine').setup {
      sections = {
        lualine_c = {
          -- custom build indicator
          {
            buildSpinner,
            cond = isBuildRunning,
            color = 'WarningMsg', -- Try this format for named colors
          },
        },
        lualine_x = {
          -- gopls memory indicator
          {
            goplsMemory.getGoplsMemory,
            cond = goplsMemory.hasGopls,
            color = goplsMemory.getMemoryColor,
          },
        },
        lualine_y = {
          'progress',
          {
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            color = 'WarningMsg',
          },
        },
      },
    }
  end,
}
