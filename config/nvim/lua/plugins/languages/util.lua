local function extendOptsList(k, list)
  return function(_, opts)
    print(opts)
    opts[k] = opts[k] or {}
    print(opts[k])
    vim.list_extend(opts[k], l)
  end
end

return {
  extendOptsList = extendOptsList,
}
