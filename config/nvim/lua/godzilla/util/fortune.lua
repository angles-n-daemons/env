local function loadFortunes(filename)
  if filename == nil then
    filename = os.getenv 'HOME' .. '/.config/nvim/share/fortune/main.dat'
  end
  local f = assert(io.open(filename, 'rb'))
  local content = f:read '*all'
  local fortunes = {}
  for fortune, _ in string.gmatch(content, '[^%%]+') do
    fortunes[#fortunes + 1] = fortune
  end
  return fortunes
end

local function getFortune(fortunes)
  if fortunes == nil then
    fortunes = FORTUNES
  end
  math.randomseed(os.time())
  return fortunes[math.random(#fortunes)]
end

local function getDashboardFortune(fortunes)
  local fortune = getFortune(fortunes)
  local lines = { ' ' }
  for line, _ in string.gmatch(fortune .. '\n', '([^\n]*)\n') do
    lines[#lines + 1] = line
  end
  return lines
end

return {
  loadFortunes = loadFortunes,
  getFortune = getFortune,
  getDashboardFortune = getDashboardFortune,
}
