local function extendOptsList(k, list)
  return function(_, opts)
    opts[k] = opts[k] or {}
    vim.list_extend(opts[k], list)
  end
end

return {
  extendOptsList = extendOptsList,
}
