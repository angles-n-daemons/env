local DIR = '.godzilla/'

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

local function load()
  local settings = readFileJSON(DIR .. 'nvim.json') or {}

  -- Override variables from environment
  -- language override
  local envLang = os.getenv 'LANGUAGE'
  if envLang ~= nil then
    settings.language = envLang
  end

  -- large project override
  local largeProject = os.getenv 'LARGE_PROJECT'
  if largeProject == 'true' then
    settings.largeProject = true
  end

  -- check building command
  local devBuild = os.getenv 'DEV_BUILD'
  if devBuild ~= nil then
    settings.devBuild = devBuild
  end

  return settings
end

return {
  load = load,
  DIR = DIR,
}
