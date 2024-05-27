local extendOptsList = require('plugins.languages.util').extendOptsList
local extendOptsTable = require('plugins.languages.util').extendOptsTable

-- local inlay_hints_settings = {
--   includeInlayEnumMemberValueHints = true,
--   addMore
-- }
local parsers = {
  'javascript',
  'typescript',
  'tsx',
}
local tools = {
  'typescript-language-server',
  'js-debug-adapter',
  'prettier',
  'eslint_d',
}
local formattersByFiletype = {
  ['javascript'] = { 'prettier', 'eslint_d' },
  ['javascriptreact'] = { 'prettier', 'eslint_d' },
  ['typescript'] = { 'prettier', 'eslint_d' },
  ['typescriptreact'] = { 'prettier', 'eslint_d' },
  ['vue'] = { 'prettier' },
  ['css'] = { 'prettier' },
  ['scss'] = { 'prettier' },
  ['less'] = { 'prettier' },
  ['html'] = { 'prettier' },
  ['json'] = { 'prettier' },
  ['jsonc'] = { 'prettier' },
  ['yaml'] = { 'prettier' },
  ['markdown'] = { 'prettier' },
  ['markdown.mdx'] = { 'prettier' },
  ['graphql'] = { 'prettier' },
  ['handlebars'] = { 'prettier' },
}

return {
  -- add treesitter filetypes which will not autoinstall
  {
    'nvim-treesitter/nvim-treesitter',
    optional = true,
    opts = extendOptsList('ensure_installed', parsers),
  },

  -- required plugins for typescript development
  {
    'williamboman/mason.nvim',
    optional = true,
    opts = extendOptsList('ensure_installed', tools),
  },

  -- add formatting settings
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = extendOptsTable('formatters_by_ft', formattersByFiletype),
  },

  -- add testing settings
  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = {
      'nvim-neotest/neotest-jest',
    },
    opts = function(_, opts)
      local adapter = require 'neotest-jest' {
        jestCommand = 'npm test --',
      }
      extendOptsList('adapters', { adapter })(_, opts)
    end,
  },

  -- debug adapter configuration
  {
    'mfussenegger/nvim-dap',
    optional = true,
    opts = function()
      local dap = require 'dap'
      if not dap.adapters['pwa-node'] then
        require('dap').adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            -- 💀 Make sure to update this path to point to your installation
            args = {
              require('mason-registry').get_package('js-debug-adapter'):get_install_path()
              .. '/js-debug/src/dapDebugServer.js',
              '${port}',
            },
          },
        }
      end

      for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = 'pwa-node',
              request = 'launch',
              name = 'Launch file',
              program = '${file}',
              cwd = '${workspaceFolder}',
            },
            {
              type = 'pwa-node',
              request = 'attach',
              name = 'Attach',
              processId = require('dap.utils').pick_process,
              cwd = '${workspaceFolder}',
            },
          }
        end
      end
    end,
  },
}
