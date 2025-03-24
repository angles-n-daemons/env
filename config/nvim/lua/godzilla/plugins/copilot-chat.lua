local function copilot()
  return require 'CopilotChat'
end

local function openChat()
  copilot().open()
end

local function promptAction()
  local actions = require 'CopilotChat.actions'
  require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
end

local function selectModel()
  require('CopilotChat').select_model()
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
      model = 'claude-3.7-sonnet-thought',
      mappings = {
        -- Overriding the default keybindings to avoid collision with window jumping
        reset = {
          normal = '<C-r>',
          insert = '<C-r>',
        },
      },
      contexts = {
        jeeves = {
          resolve = function()
            return require('jeeves').collect_context()
          end,
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
        promptAction,
        desc = 'Copilot [A]ctions',
      },
      {
        '<leader>ac',
        '<cmd>CopilotChatCommit<cr>',
        desc = 'Copilot [C]ommit',
      },
      {
        '<leader>am',
        selectModel,
        desc = 'Copilot [C]ommit',
      },
    },
  },
}
