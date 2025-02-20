local telescope = require 'godzilla.util.telescope'

local function mapLsp(event)
  return function(mode, keys, func, desc)
    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end
end

return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'folke/neodev.nvim', opts = {} },
    },
    keys = {
      ['<leader>cl'] = { '<cmd>LspInfo<cr>', 'Lsp Info' },
    },
    config = function()
      -- Setup mapping for when the lsp attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = mapLsp(event)
          map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
          map('n', 'gd', telescope('lsp_definitions', { reuse_win = true }), '[G]oto [D]efinition')
          map('n', 'gr', '<cmd>Telescope lsp_references<cr>', 'References')
          map('n', 'gI', telescope('lsp_implementations', { reuse_win = true }), '[G]oto [I]mplementation')
          map('n', 'gy', telescope('lsp_type_definitions', { reuse_win = true }), '[G]oto T[y]pe Definitions')
          map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code Action')
          map('n', '<leader>K', vim.lsp.buf.signature_help, 'Signature Help')
          map('i', '<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
        end,
      })
      require('neodev').setup {}
      require('mason').setup()

      -- automatically configure nvim-lspconfig
      require('mason-lspconfig').setup {
        automatic_installation = true,
      }
      -- setup the installed lsps
      require('mason-lspconfig').setup_handlers {
        function(server_name) -- default handler (optional)
          local lsp_opts = SETTINGS.lspOpts
          local opts = (lsp_opts and lsp_opts[server_name]) or {}

          -- manual patch for clangd to remove protobuf from the defaults
          if server_name == 'clangd' then
            opts.filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' }
          end

          require('lspconfig')[server_name].setup(opts)
        end,
      }
    end,
  },
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = {
      { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' },
    },
    build = ':MasonUpdate',
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require 'mason-registry'
      mr:on('package:install:success', function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require('lazy.core.handler.event').trigger {
            event = 'FileType',
            buf = vim.api.nvim_get_current_buf(),
          }
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed or {}) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
