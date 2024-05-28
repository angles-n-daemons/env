require 'godzilla.config.options'
require 'godzilla.config.languages'
require 'godzilla.config.keymaps'
require 'godzilla.config.autocmds'

-- Plugin imports
require 'godzilla.config.spec'
spec 'godzilla.plugins.colors'
spec 'godzilla.plugins.languages'
spec 'godzilla.plugins.conform'
-- spec 'godzilla.plugins.copilot'
spec 'godzilla.plugins.dashboard-vim'
spec 'godzilla.plugins.dressing'
spec 'godzilla.plugins.gitsigns'
spec 'godzilla.plugins.lualine'
spec 'godzilla.plugins.neo-tree'
spec 'godzilla.plugins.neotest'
spec 'godzilla.plugins.noice'
spec 'godzilla.plugins.nvim-cmp'
spec 'godzilla.plugins.nvim-dap'
spec 'godzilla.plugins.nvim-lspconfig'
spec 'godzilla.plugins.nvim-notify'
spec 'godzilla.plugins.telescope'
spec 'godzilla.plugins.treesitter'
spec 'godzilla.plugins.trouble'
spec 'godzilla.plugins.vim-tmux-navigator'
spec 'godzilla.plugins.which-key'
spec 'godzilla.plugins.zoomwintab'
require 'godzilla.config.lazy'

require 'godzilla.config.colors'
