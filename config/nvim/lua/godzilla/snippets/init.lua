if SETTINGS.language == nil then
  return {}
end

-- Load specific language plugin settings
pcall(require, 'godzilla.snippets.' .. SETTINGS.language)
