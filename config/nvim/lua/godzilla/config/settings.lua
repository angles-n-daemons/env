local function readFileJSON(filename)
  local resolved_path = (vim.fn.getcwd() .. '/' .. filename)
  if not vim.loop.fs_stat(resolved_path) then
    return
  end
  local lines = {}
  for line in io.lines(resolved_path) do
    if not vim.startswith(vim.trim(line), '//') then
      table.insert(lines, line)
    end
  end
  local contents = table.concat(lines, '\n')
  return assert(vim.json.decode(contents), 'nvim.json must contain a JSON object')
end

return function()
  local settings = readFileJSON '.godzilla/nvim.json' or {}

  -- Override variables from environment
  local envLang = os.getenv 'LANGUAGE'
  if envLang ~= nil then
    settings.language = envLang
  end

  return settings
end
