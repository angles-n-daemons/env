local telescope = require('plugins.util.telescope')

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
      'WhoIsSethDaniel/mason-tool-installer.nvim',
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
          map('n', '<leader>K', vim.lsp.buf.signature_help, 'Signature Help')
          map('i', '<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
        end
      })
      require('neodev').setup({})
      require('mason').setup()
      require('mason-lspconfig').setup()
      require('mason-lspconfig').setup_handlers({
        function (server_name) -- default handler (optional)
            require('lspconfig')[server_name].setup {}
        end,
      })
      -- TODO: possibly tear away handlers when detaching, kickstart seems to only do that for autocmds
    end,
  },
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = {
      { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' },
    },
    build = ':MasonUpdate',
    config = function(_, _)
      -- trigger filetype event to load new lsp server
      -- optionally use the options to ensure some packages are installed by default
    end
  },
}
