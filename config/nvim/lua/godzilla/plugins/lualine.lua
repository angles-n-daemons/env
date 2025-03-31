local isBuildRunning = require('godzilla.jobs.build-status').isBuildRunning
local buildText = require('godzilla.util.spinner').spinner 'BUILDING'

return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function(_, opts)
    require('lualine').setup {
      sections = {
        -- custom build status indicator
        lualine_c = {
          {
            function()
              return buildText()
            end,
            color = { fg = '#ff0000' },
            cond = isBuildRunning,
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
