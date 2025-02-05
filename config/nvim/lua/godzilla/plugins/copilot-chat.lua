local function copilot()
  return require 'CopilotChat'
end

local function openChat()
  copilot().open()
end

local function copilotActions()
  local actions = require 'CopilotChat.actions'
  require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
end

return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      model = 'gpt-4o',
      mappings = {
        -- Overriding the default keybindings to avoid collision with window jumping
        reset = {
          normal = '<C-r>',
          insert = '<C-r>',
        },
      },
    },
    config = function(_, opts)
      -- prevent autoinserting into copilot windows
      vim.opt.completeopt = { 'menuone', 'popup', 'noinsert' }
      copilot().setup(opts)
    end,
    keys = {
      { '<leader>ai', openChat, desc = 'Copilot Chat' },
      {
        mode = { 'n', 'v' },
        '<leader>aa',
        copilotActions,
        desc = 'Copilot [A]ctions',
      },
      {
        '<leader>ac',
        '<cmd>CopilotChatCommit<cr>',
        desc = 'Copilot [C]ommit',
      },
    },
  },
}
