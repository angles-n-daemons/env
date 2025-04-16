local telescope = require 'godzilla.util.telescope'

local exploreCwd = function()
  require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
end

local exploreCurrentFileDir = function()
  require('neo-tree.command').execute { toggle = true, reveal = true, dir = vim.uv.cwd() }
end

local exploreFileDir = function()
  local fileDir = vim.cmd 'echo expand("%:p:h")'
  require('neo-tree.command').execute { toggle = true, dir = fileDir }
end

local exploreGit = function()
  require('neo-tree.command').execute { source = 'git_status', toggle = true }
end

local exploreBuffers = function()
  require('neo-tree.command').execute { source = 'buffers', toggle = true }
end

local getCursorDir = function(node)
  local f = io.open(node.id, 'r')
  if not f then
    return '.'
  end
  local _, _, code = f:read(1)
  f:close()

  if code == 21 then
    return node.id
  else
    return node._parent_id
  end
end

-- <bs> - navigates working directory up
-- . sets current working directory
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '<leader>e',
      exploreCwd,
      desc = 'Explorer NeoTree (cwd)',
    },
    {
      '<leader>fr',
      exploreCurrentFileDir,
      desc = 'Explorer NeoTree (cwd)',
    },
    {
      '<leader>fe',
      exploreFileDir,
      desc = 'Explorer NeoTree (cwd)',
    },
    {
      '<leader>ge',
      exploreGit,
      desc = 'Git Explorer',
    },
    {
      '<leader>be',
      exploreBuffers,
      desc = 'Buffer Explorer',
    },
    -- possibly override navigate down
    -- possibly override navigate up
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          -- disable fuzzy-finder
          ['/'] = 'noop',
          ['F'] = {
            function(state)
              require('telescope.builtin').live_grep { cwd = getCursorDir(state.tree:get_node()) }
            end,
            desc = 'Search in current directory.',
          },
        },
      },
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      mappings = {
        ['<space>'] = 'none',
      },
    },
  },
}
