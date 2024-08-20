local didInstrumentCodebase = false

local function toggleProfile()
  -- only setup instrumentation once
  if didInstrumentCodebase then
    require('profile').instrument_autocmds()
    require('profile').instrument '*'
  end

  local prof = require 'profile'
  if prof.is_recording() then
    prof.stop()
    vim.ui.input({ prompt = 'Save profile to:', completion = 'file', default = '/tmp/profile.json' }, function(filename)
      if filename then
        prof.export(filename)
        vim.notify(string.format('Wrote %s', filename))
      end
    end)
  else
    prof.start '*'
  end
end

return {
  'stevearc/profile.nvim',
  lazy = true,
  keys = {
    { '<leader>PP', toggleProfile, desc = 'Toggle Profile' },
  },
}
