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
