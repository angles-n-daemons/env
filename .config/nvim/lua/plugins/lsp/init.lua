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
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
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
      -- TODO: possibly tear away handlers when detaching, though not sure if that's a real use case
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
