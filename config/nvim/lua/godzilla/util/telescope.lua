return function(operator, arguments)
  return function()
    local opts = {}
    for k, v in pairs(arguments or {}) do
      opts[k] = v
    end
    require('telescope.builtin')[operator](opts)
  end
end
