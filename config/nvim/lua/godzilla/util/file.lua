local function getFirstLine(err)
  for s in err:gmatch '[^\r\n]+' do
    return s
  end
  return nil
end

local function isModuleMissingError(err)
  local firstLine = getFirstLine(err)
  if firstLine == nil then
    error 'isModuleMissingError: could not read error'
  end
  return string.find(firstLine, 'not found') ~= nil
end

local function fileExists(name)
  local f = io.open(name, 'r')
  return f ~= nil and io.close(f)
end

return {
  isModuleMissingError = isModuleMissingError,
  fileExists = fileExists,
}
