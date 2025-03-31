local spinner = function(text)
  local frames = {
    '[------] ',
    '[>-----] ',
    '[=>----] ',
    '[==>---] ',
    '[===>--] ',
    '[====>-] ',
    '[=====>] ',
    '[======] ',
  }
  local current = 1
  return function()
    local frame = frames[current]
    current = current + 1
    if current > #frames then
      current = 1
    end
    return frame .. ' ' .. text
  end
end

return {
  spinner = spinner,
}
