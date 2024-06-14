local isModuleMissingError = require('godzilla.util.file').isModuleMissingError

if SETTINGS.language == nil then
  return {}
end

-- Load specific language plugin settings
local status, lang = pcall(require, 'godzilla.plugins.languages.' .. SETTINGS.language)
if status then
  return lang
end
-- If module not defined for language, do nothing
if isModuleMissingError(lang) then
  return {}
end
-- Otherwise reraise error that require returned
error(lang)
return nil
