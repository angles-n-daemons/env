local config = {
  lua = {
    lsp = 'lua_ls',
    formatter = 'stylua',
  },
  javascript = {
    lsp = 'tsserver',
    -- dap = 'js-debug-adapter',
    -- linter = ''
    formatter = 'eslint_d',
    test = {
      repo = 'nvim-neotest/neotest-jest',
      getAdapter = function()
        return require('neotest-jest')({
          jestCommand = "npm test --",
        })
      end
    },
  },
  css = { formatter = "prettier" },
  html = { formatter = "prettier" },
  json = { formatter = "prettier" },
  javascriptreact = { formatter = "prettier" },
}

return config
