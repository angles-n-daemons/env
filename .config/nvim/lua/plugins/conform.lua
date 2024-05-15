local languages = require 'config.languages'
local function format()
  require('conform').format()
end

return {
  'stevearc/conform.nvim',
  lazy = false,
  config = function()
    local formatters = {}
    for lang, config in pairs(languages) do
      if config.formatter ~= nil then
        formatters[lang] = { config.formatter }
      end
    end
    require('conform').setup {
      formatters_by_ft = formatters,
      format_on_save = {
        timeout_ms = 1000,
        async = false,
        quiet = false,
        lsp_fallback = true,
      },
    }
  end,
  keys = {
    { '<leader>cf', format, desc = '[C]ode [F]ormat' },
  },
}
