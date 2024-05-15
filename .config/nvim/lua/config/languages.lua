local config = {
  lua = {
    lsp = 'lua_ls',
    formatter = 'stylua',
  },
  javascript = {
    lsp = 'tsserver',
    -- dap = 'js-debug-adapter',
    -- linter = ''
    formatter = 'prettier',
    test = {
      repo = 'nvim-neotest/neotest-jest',
      getAdapter = function()
        return require('neotest-jest')({
          jestCommand = "npm test --",
        })
      end
    },
  },
}

return config
