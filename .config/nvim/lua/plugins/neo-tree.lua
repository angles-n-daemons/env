local exploreCwd = function()
  require('neo-tree.command').execute({ toggle = true, dir = vim.uv.cwd() })
end

local exploreFileDir = function()
  local fileDir = vim.cmd('echo expand("%:p:h")')
  require('neo-tree.command').execute({ toggle = true, dir = fileDir })
end

local exploreGit = function()
  require('neo-tree.command').execute({ source = 'git_status', toggle = true })
end

local exploreBuffers = function()
  require('neo-tree.command').execute({ source = 'buffers', toggle = true })
end

-- <bs> - navigates working directory up
-- . sets current working directory
-- TODO: reorg key mappings, having a leader single key to open close window

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
      '<leader>ee',
      exploreCwd,
      desc = 'Explorer NeoTree (cwd)',
    },
    {
      '<leader>ef',
      exploreFileDir,
      desc = 'Explorer NeoTree (cwd)',
    },
    {
      '<leader>eg',
      exploreGit,
      desc = 'Git Explorer',
    },
    {
      '<leader>eb',
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
  config = function(_, _)
    -- TODO: when file is moved, update the lsp like lazy does
    -- TODO: when lazygit closes, update the git status of the tree
  end
}
