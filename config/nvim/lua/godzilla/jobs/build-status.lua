local buildRunning = false

-- Use an anchored regex so we only match processes whose command line
-- *starts* with "./dev"
local function set_build_running(_, data, __)
  local nooutput = #data == 0 or #data[1] == 0
  local notfound = #data > 0 and string.find(data[1], 'command not found')
  if nooutput or notfound then
    -- going from building to not building
    if buildRunning then
      vim.notify('Build completed.', vim.log.levels.WARN)
    end
    buildRunning = false
  else
    buildRunning = true
  end
end

-- 1) Define a function to spawn a process and handle its output
local function check_status()
  vim.fn.jobstart('zsh -c "devbuild"', {
    stdout_buffered = true,
    on_stdout = set_build_running,
  })
end

-- 2) Set up a timer to run `check_status()` every 5 seconds
local timer = vim.loop.new_timer()
timer:start(
  0, -- how long to wait before first call (ms)
  5000, -- repeat interval (ms)
  vim.schedule_wrap(function() -- use schedule_wrap to safely interact with Neovim
    check_status()
  end)
)

local function isBuildRunning()
  return buildRunning
end

return {
  isBuildRunning = isBuildRunning,
}
