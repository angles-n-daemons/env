local LAZY_PLUGIN_SPEC = {}

local function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

return {
  spec = spec,
  LAZY_PLUGIN_SPEC = LAZY_PLUGIN_SPEC,
}
