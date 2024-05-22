local function format()
  require('conform').format()
end

return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  opts = {
    format_on_save = {
      timeout_ms = 300,
      async = false,
      quiet = false,
      lsp_fallback = true,
    },
  },
  config = function(_, opts)
    require('conform').setup(opts)
  end,
  keys = {
    { '<leader>cf', format, desc = '[C]ode [F]ormat' },
  },
}
