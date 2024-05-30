local disabledFileTypes = {
  'help',
  'alpha',
  'dashboard',
  'neo-tree',
  'Trouble',
  'trouble',
  'lazy',
  'mason',
  'notify',
}

return {
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    opts = {
      symbol = '│',
      options = { try_as_border = 'true' },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = disabledFileTypes,
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function()
      require('mini.indentscope').setup()
    end,
  },
}
