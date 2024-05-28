-- remap semicolon to colon
vim.keymap.set('n', ';', ':')
-- set leader to space
vim.g.mapleader = ' '
-- set localleader to \
vim.g.maplocalleader = '\\'

require 'config.spec'
require 'config.languages'
require 'config.keymaps'
require 'config.autocmds'
require 'config.options'

spec 'plugins.colors'
spec 'plugins.languages'
spec 'plugins.conform'
-- spec 'plugins.copilot'
spec 'plugins.dashboard-vim'
spec 'plugins.dressing'
spec 'plugins.neo-tree'
spec 'plugins.neotest'
spec 'plugins.nvim-cmp'
spec 'plugins.nvim-dap'
spec 'plugins.nvim-lspconfig'
spec 'plugins.telescope'
spec 'plugins.treesitter'
spec 'plugins.vim-tmux-navigator'
spec 'plugins.which-key'
spec 'plugins.zoomwintab'

require 'config.lazy'
require 'config.colors'

-- TODO: get rid of the below
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
