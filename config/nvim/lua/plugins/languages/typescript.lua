--local inlay_hints_settings = {
--  includeInlayEnumMemberValueHints = true,
--  includeInlayFunctionLikeReturnTypeHints = true,
--  includeInlayFunctionParameterTypeHints = true,
--  includeInlayParameterNameHints = 'literal',
--  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--  includeInlayPropertyDeclarationTypeHints = true,
--  includeInlayVariableTypeHints = false,
--  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
--}
local filetypes = {
  'javascript',
  'javascriptreact',
  'javascript.jsx',
  'typescript',
  'typescriptreact',
  'typescript.tsx',
}
local typescriptTools = {
  'typescript-language-server',
  'js-debug-adapter',
  'prettier',
  'eslint_d',
}
local formattersByFiletype = {
  ['javascript'] = { 'prettier' },
  ['javascriptreact'] = { 'prettier' },
  ['typescript'] = { 'prettier' },
  ['typescriptreact'] = { 'prettier' },
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
  ft = filetypes,

  -- add treesitter filetypes which will not autoinstall
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'typescript', 'tsx' })
      end
    end,
  },

  -- required plugins for typescript development
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, typescriptTools)
    end,
  },

  -- add formatting settings
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = {
      formatters_by_ft = formattersByFiletype,
    },
  },

  -- add testing settings
  {
    'nvim-neotest/neotest',
    optional = true,
    requires = {
      'nvim-neotest/neotest-jest',
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}

      local jest = require('neotest-jest')({
        jestCommand = 'npm test --',
      })
      table.insert(opts.adapters, jest)
    end
  },


  -- Only add this if you can get inlay hints to work
  -- -- correctly setup lspconfig
  -- {
  --   'neovim/nvim-lspconfig',
  --   opts = {
  --     servers = {
  --       tsserver = {
  --         settings = {
  --           typescript = {
  --             inlayHints = inlay_hints_settings,
  --           },
  --           javascript = {
  --             inlayHints = inlay_hints_settings,
  --           },
  --           completions = {
  --             completeFunctionCalls = true,
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },

  -- {
  --   'mfussenegger/nvim-dap',
  --   optional = true,
  --   opts = function()
  --     local dap = require 'dap'
  --     if not dap.adapters['pwa-node'] then
  --       require('dap').adapters['pwa-node'] = {
  --         type = 'server',
  --         host = 'localhost',
  --         port = '${port}',
  --         executable = {
  --           command = 'node',
  --           -- 💀 Make sure to update this path to point to your installation
  --           args = {
  --             require('mason-registry').get_package('js-debug-adapter'):get_install_path()
  --             .. '/js-debug/src/dapDebugServer.js',
  --             '${port}',
  --           },
  --         },
  --       }
  --     end
  --     if not dap.adapters['node'] then
  --       dap.adapters['node'] = function(cb, config)
  --         if config.type == 'node' then
  --           config.type = 'pwa-node'
  --         end
  --         local nativeAdapter = dap.adapters['pwa-node']
  --         if type(nativeAdapter) == 'function' then
  --           nativeAdapter(cb, config)
  --         else
  --           cb(nativeAdapter)
  --         end
  --       end
  --     end

  --     for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
  --       if not dap.configurations[language] then
  --         dap.configurations[language] = {
  --           {
  --             type = 'pwa-node',
  --             request = 'launch',
  --             name = 'Launch file',
  --             program = '${file}',
  --             cwd = '${workspaceFolder}',
  --           },
  --           {
  --             type = 'pwa-node',
  --             request = 'attach',
  --             name = 'Attach',
  --             processId = require('dap.utils').pick_process,
  --             cwd = '${workspaceFolder}',
  --           },
  --         }
  --       end
  --     end
  --   end,
  -- },
  -- BELOW is lazyvim only stuff, unsure what recommended does
  -- recommended = function()
  --   return LazyVim.extras.wants {
  --     root = { 'tsconfig.json', 'package.json', 'jsconfig.json' },
  --   }
  -- end,


}
