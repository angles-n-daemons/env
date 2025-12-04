local goplsMemory = nil
local memoryColor = nil

-- Convert memory string to MB
local function parse_memory(mem_str)
  if not mem_str or mem_str == '' then
    return nil
  end

  local num, unit = mem_str:match '^([%d%.]+)([KMGT]?)$'
  if not num then
    return nil
  end

  num = tonumber(num)
  if not num then
    return nil
  end

  -- Convert to MB
  if unit == 'K' then
    return num / 1024
  elseif unit == 'M' or unit == '' then
    return num
  elseif unit == 'G' then
    return num * 1024
  elseif unit == 'T' then
    return num * 1024 * 1024
  end

  return num
end

-- Determine color based on memory usage
local function get_color_for_memory(memory_mb)
  if not memory_mb then
    return nil
  end

  local memory_gb = memory_mb / 1024

  if memory_gb < 3 then
    return { fg = '#98c379' } -- Green
  elseif memory_gb < 7 then
    return { fg = '#e5c07b' } -- Yellow/Warning
  elseif memory_gb < 10 then
    return { fg = '#e06c75' } -- Red/Error
  else
    return { fg = '#ff6c6b', gui = 'bold' } -- Bright red/Critical
  end
end

-- Format memory for display
local function format_memory(memory_mb)
  if not memory_mb then
    return nil
  end

  if memory_mb < 1024 then
    return string.format('%.0fM', memory_mb)
  else
    local memory_gb = memory_mb / 1024
    if memory_gb < 10 then
      return string.format('%.1fG', memory_gb)
    else
      return string.format('%.0fG', memory_gb)
    end
  end
end

-- Check gopls memory usage
local function check_gopls_memory()
  -- Using top command to get memory usage, sorted by MEM
  vim.fn.jobstart("top -o MEM -l 1 | grep gopls | head -1 | awk '{print $8}'", {
    stdout_buffered = true,
    on_stdout = function(_, data, __)
      if not data or #data == 0 or (data[1] and data[1] == '') then
        goplsMemory = nil
        memoryColor = nil
        return
      end

      local mem_str = data[1]
      if mem_str and mem_str ~= '' then
        local memory_mb = parse_memory(mem_str)
        if memory_mb and memory_mb > 0 then
          goplsMemory = format_memory(memory_mb)
          memoryColor = get_color_for_memory(memory_mb)
        else
          goplsMemory = nil
          memoryColor = nil
        end
      else
        goplsMemory = nil
        memoryColor = nil
      end
    end,
  })
end

-- Set up timer to check every 5 seconds
local timer = vim.loop.new_timer()
timer:start(
  0, -- Initial delay
  5000, -- Repeat interval (5 seconds)
  vim.schedule_wrap(function()
    check_gopls_memory()
  end)
)

-- Public API
local function getGoplsMemory()
  if goplsMemory then
    return 'gp ' .. goplsMemory
  end
  return nil
end

local function getMemoryColor()
  return memoryColor
end

local function hasGopls()
  return goplsMemory ~= nil
end

return {
  getGoplsMemory = getGoplsMemory,
  getMemoryColor = getMemoryColor,
  hasGopls = hasGopls,
}
