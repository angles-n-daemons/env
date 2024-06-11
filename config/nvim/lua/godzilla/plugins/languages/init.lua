if SETTINGS.language == nil then
  return {}
end

local status, lang = pcall(require, 'godzilla.plugins.languages.' .. SETTINGS.language)
if status then
  return lang
else
  return {}
end
