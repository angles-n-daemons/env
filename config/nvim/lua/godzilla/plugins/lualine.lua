local isBuildRunning = require('godzilla.jobs.build-status').isBuildRunning
local buildSpinner = require 'godzilla.util.spinner' 'BUILDING'

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
