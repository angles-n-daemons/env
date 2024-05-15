local config = {
  lua = {
    lsp = 'lua_ls',
    formatter = 'stylua',
  },
  javascript = {
    lsp = 'tsserver',
    -- dap = 'js-debug-adapter',
    formatter = 'prettier',
  },
  typescript = {
    lsp = 'tsserver',
    -- dap = 'js-debug-adapter',
    formatter = 'prettier',
  },
}

return { config = config }
