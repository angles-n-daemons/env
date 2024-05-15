local languages = require('config.languages')
local function getDependencies(languages)
  -- base dependencies for nvim-neotest
  local dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  }
  -- add additional language dependencies (ie neotest-jest)
  for _, config in pairs(languages) do
    if (config.test ~= nil) then
      table.insert(dependencies, config.test.repo)
    end
  end
  return dependencies
end

return {
  'nvim-neotest/neotest',
  dependencies = getDependencies(languages),
  keys = {
    {
      '<leader>tt',
      function() require('neotest').run.run() end,
      desc = 'Run Nearest'
    },
    {
      '<leader>tf',
      function() require('neotest').run.run(vim.fn.expand('%')) end,
      desc = 'Run File'
    },
    {
      '<leader>tp',
      function() require('neotest').run.run(vim.loop.cwd()) end,
      desc = 'Run All Test Files'
    },
    {
      '<leader>ts',
      function() require('neotest').summary.toggle() end,
      desc = 'Toggle Summary'
    },
    {
      '<leader>to',
      function() require('neotest').output.open({ enter = false, auto_close = true }) end,
      desc = 'Show Output'
    },
    {
      '<leader>tO',
      function() require('neotest').output_panel.toggle() end,
      desc = 'Toggle Output Panel'
    },
    {
      '<leader>tS',
      function() require('neotest').run.stop() end,
      desc = 'Stop'
    },
  },
  config = function()
    local adapters = {}
    for _, config in pairs(languages) do
      if (config.test ~= nil) then
        table.insert(adapters, config.test.getAdapter())
      end
    end
    require('neotest').setup({
      adapters = adapters,
      quickfix = {
        enabled = false,
        open = false,
      },
      output_panel = {
        enabled = true,
        open = 'rightbelow vsplit | resize 30',
      },
      status = {
        enabled = true,
        virtual_text = false,
        signs = true,
      },
    })
  end
}
