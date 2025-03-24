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

local function fiveSecondProfile()
  -- Start profiling
  toggleProfile()

  -- Notify user that profiling has started
  vim.notify 'Profiling started. Will run for 5 seconds...'

  -- Schedule stopping the profile after 5 seconds
  vim.defer_fn(function()
    toggleProfile()
    vim.notify 'Profiling completed after 5 seconds'
  end, 5000)
end

return {
  'stevearc/profile.nvim',
  lazy = true,
  keys = {
    { '<leader>PP', toggleProfile, desc = 'Toggle Profile' },
    { '<leader>P5', fiveSecondProfile, desc = 'Five second profile' },
  },
}
