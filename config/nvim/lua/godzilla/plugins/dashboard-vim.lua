local logo = [[
██████╗  ██████╗ ██████╗ ███████╗██╗██╗     ██╗      █████╗
██╔════╝ ██╔═══██╗██╔══██╗╚══███╔╝██║██║     ██║     ██╔══██╗
██║  ███╗██║   ██║██║  ██║  ███╔╝ ██║██║     ██║     ███████║
██║   ██║██║   ██║██║  ██║ ███╔╝  ██║██║     ██║     ██╔══██║
╚██████╔╝╚██████╔╝██████╔╝███████╗██║███████╗███████╗██║  ██║
 ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
]]

if LANGUAGE == 'python' then
  logo = [[
                                __               
                               /  |              
  ______   __    __  __     __ $$/  _____  ____  
 /      \ /  |  /  |/  \   /  |/  |/     \/    \ 
/$$$$$$  |$$ |  $$ |$$  \ /$$/ $$ |$$$$$$ $$$$  |
$$ |  $$ |$$ |  $$ | $$  /$$/  $$ |$$ | $$ | $$ |
$$ |__$$ |$$ \__$$ |  $$ $$/   $$ |$$ | $$ | $$ |
$$    $$/ $$    $$ |   $$$/    $$ |$$ | $$ | $$ |
$$$$$$$/   $$$$$$$ |    $/     $$/ $$/  $$/  $$/ 
$$ |      /  \__$$ |                             
$$ |      $$    $$/                              
$$/        $$$$$$/                               
  ]]
  local version = '󰌠 ' .. vim.fn.system 'python3 --version'
  version = version.gsub(version, '\n', ' ')
  -- line length is 50, [ ] takes up 4 chars, want to subtract half the version to center
  local padding = string.rep(' ', 14 - (#version / 2))
  logo = logo .. '\n' .. padding .. '[ ' .. version .. ' ]'
elseif LANGUAGE == 'typescript' then
  logo = [[
   /\\\                                  /\\\                           
 /\\\\\\\\\\\  /\\\\\\\\\\  /\\\    /\\\ \///     /\\\\\  /\\\\\        
 \////\\\////  \/\\\//////  \//\\\  /\\\   /\\\  /\\\///\\\\\///\\\     
     \/\\\      \/\\\\\\\\\\  \//\\\/\\\   \/\\\ \/\\\ \//\\\  \/\\\    
      \/\\\ /\\  \////////\\\   \//\\\\\    \/\\\ \/\\\  \/\\\  \/\\\   
       \//\\\\\    /\\\\\\\\\\    \//\\\     \/\\\ \/\\\  \/\\\  \/\\\  
         \/////    \//////////      \///      \///  \///   \///   \///  
  ]]
  local version = ' node ' .. vim.fn.system 'node --version'
  version = version.gsub(version, '\n', ' ')
  local padding = string.rep(' ', 12 - (#version / 2))
  logo = logo .. '\n' .. padding .. '[ ' .. version .. ' ]'
elseif LANGUAGE == 'go' then
  logo = [[
                  _                    ,_--~~~~~---_         
                 (_)            _,,,*^___      ____``*g*\*, 
   __ _  _____   ___ _ __ ___   / __ /'    ^.  /     \ ^@   f 
  / _` |/ _ \ \ / / | '_ ` _ \ [  @f| @))   |  | @))  l  0_/  
| (_| | (_) \ V /| | | | | | | \`/  \~___ / __ \____/   \   
  \__, |\___/ \_/ |_|_| |_| |_|  |         _l__l_         I   
   __/ |                         }        [______]         I  
  |___/                          ]         |_|_|           |  
  ]]
elseif LANGUAGE == 'c' then
  logo = [[
  
 ██████       ██    ██ ████ ███    ███ 
██            ██    ██  ██  ████  ████ 
██      █████ ██    ██  ██  ██ ████ ██ 
██             ██  ██   ██  ██  ██  ██ 
 ██████         ████   ████ ██      ██ 
                                     
  ]]
elseif LANGUAGE == 'lua' then
  logo = [[
    _/                                  _/                 
   _/  _/    _/    _/_/_/  _/      _/      _/_/_/  _/_/    
  _/  _/    _/  _/    _/  _/      _/  _/  _/    _/    _/   
 _/  _/    _/  _/    _/    _/  _/    _/  _/    _/    _/    
_/    _/_/_/    _/_/_/      _/      _/  _/    _/    _/     
  ]]
elseif LANGUAGE == 'rust' then
  logo = [[
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  _______     | || |    _______   | || | ____   ____  | || |     _____    | || | ____    ____ | |
| | |_   __ \    | || |   /  ___  |  | || ||_  _| |_  _| | || |    |_   _|   | || ||_   \  /   _|| |
| |   | |__) |   | || |  |  (__ \_|  | || |  \ \   / /   | || |      | |     | || |  |   \/   |  | |
| |   |  __ /    | || |   '.___`-.   | || |   \ \ / /    | || |      | |     | || |  | |\  /| |  | |
| |  _| |  \ \_  | || |  |`\____) |  | || |    \ ' /     | || |     _| |_    | || | _| |_\/_| |_ | |
| | |____| |___| | || |  |_______.'  | || |     \_/      | || |    |_____|   | || ||_____||_____|| |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
  ]]
end

local exploreCwd = function()
  require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
end

return {
  'nvimdev/dashboard-nvim',
  opts = function()
    logo = string.rep('\n', 8) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files", desc = " Find File", icon = " ", key = "f" },
          { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
          { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
          { action = "Telescope live_grep", desc = " Search", icon = " ", key = "s" },
          { action = exploreCwd, desc = " Explore", icon = "󰙅 ", key = "e" },
          { action = [[print('not ready')]], desc = " Config", icon = " ", key = "c" },
          { action = "qa", desc = " Quit", icon = " ", key = "q" },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DashboardLoaded',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    return opts
  end,
}