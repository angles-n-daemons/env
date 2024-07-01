return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  commit = 'a110e12',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function(_, opts)
            -- load vscode snippets
            require('luasnip.loaders.from_vscode').lazy_load()

            -- load additional snippets for given filetypes
            for ft, snippets in pairs(opts.snippet_additions or {}) do
              require('luasnip').filetype_extend(ft, snippets)
            end

            -- load personal snippets
            require 'godzilla.snippets'
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {
      store_selection_keys = '<Tab>',
      history = true,
      updateevents = 'TextChanged,TextChangedI',
      enable_autosnippets = true, -- unsure if this is worthe keeping
      ext_opts = {},
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      experimental = { ghost_text = true },
      completion = { completeopt = 'menu,menuone,noinsert' },
      updateevents = 'TextChanged,TextChangedi',

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- scroll options
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        --['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- confirm / cancel
        ['<TAB>'] = cmp.mapping.confirm { select = true },
        ['<C-e>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        -- Manually trigger a completion from nvim-cmp.
        ['<C-b>'] = cmp.mapping.complete {},

        -- Navigate snippets
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- optional formattings settings

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'copilot' },
        { name = 'buffer' },
        { name = 'path' },
      },
    }
  end,
}
