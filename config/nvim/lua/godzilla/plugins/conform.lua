-- copied from https://github.com/MariaSolOs/dotfiles/blob/5e344230f63641e3e3540d489eb1d65d1dd60bf8/.config/nvim/lua/plugins/conform.lua

local function formatUnlessDisabled(bufnr)
  if vim.b[bufnr].disable_autoformat then
    return
  end
  return { timeout_ms = 500, lsp_fallback = true }
end

local function format()
  require('conform').format()
end

local function conformNotify(msg)
  require 'notify'(msg, 'info', { title = 'conform.nvim' })
end

local function toggleBufferAutoformat()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
  if vim.b.disable_autoformat then
    conformNotify 'Autoformat disabled in this buffer'
  else
    conformNotify 'Autoformat enabled in this buffer'
  end
end

return {
  'stevearc/conform.nvim',
  event = { 'LspAttach', 'BufWritePre' },
  opts = {
    notify_on_error = false,
    format_on_save = formatUnlessDisabled,
  },
  config = function(_, opts)
    require('conform').setup(opts)
  end,
  keys = {
    { '<leader>cf', format, desc = '[C]ode [F]ormat' },
    { '<leader>uf', toggleBufferAutoformat, desc = 'Toggle Autoformat (buffer)' },
  },
}
