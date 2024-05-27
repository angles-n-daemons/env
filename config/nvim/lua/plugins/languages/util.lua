local function extendOptsList(k, list)
  return function(_, opts)
    opts[k] = opts[k] or {}
    vim.list_extend(opts[k], list)
  end
end

local function extendOptsTable(k, t)
  return function(_, opts)
    if opts == nil then
      return
    end
    opts[k] = opts[k] or {}
    for tk, val in pairs(t) do
      opts[k][tk] = val
    end
  end
end

return {
  extendOptsList = extendOptsList,
  extendOptsTable = extendOptsTable,
}
