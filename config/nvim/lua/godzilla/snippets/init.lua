if SETTINGS.language == nil then
  return {}
end

-- Load specific language plugin settings
local status, err = pcall(require, 'godzilla.snippets.' .. SETTINGS.language)
if status == false then
  if not string.find(err, 'module .* not found') then
    require('notify')(err, 'error', { title = 'Godzilla Snippets' })
  end
end
