return {
  'angles-n-daemons/jeeves',
  dir = '~/projects/jeeves',
  keys = {
    {
      mode = { 'v' },
      'M',
      function()
        require('jeeves').add_selection()
      end,
    },
    {
      mode = { 'n' },
      'M',
      function()
        require('jeeves').remove_selections_under_cursor()
      end,
    },
    {
      '<leader>jc',
      function()
        require('jeeves').clear()
      end,
    },
  },
}
