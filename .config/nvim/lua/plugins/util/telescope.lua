return function(operator, arguments)
  return function()
    require('telescope.builtin')[operator](arguments)
  end
end
