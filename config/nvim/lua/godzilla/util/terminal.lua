local function wRepl(cmd)
  return function()
    args = 'cmd=' .. cmd .. ' go_back=0'
    require('toggleterm').exec_command(args)
  end
end

return {
  wRepl = wRepl,
}
