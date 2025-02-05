SETTINGS = require('godzilla.config.settings').load()
FORTUNES = require('godzilla.util.fortune').loadFortunes()

require 'godzilla.config.options'
require 'godzilla.config.keymaps'
require 'godzilla.config.autocmds'

-- Plugin imports
local spec = require('godzilla.util.spec').spec
spec 'godzilla.plugins.blame'
spec 'godzilla.plugins.bufferline'
spec 'godzilla.plugins.colors'
spec 'godzilla.plugins.language' -- variable based on language setting
spec 'godzilla.plugins.conform'
spec 'godzilla.plugins.copilot'
spec 'godzilla.plugins.copilot-chat'
spec 'godzilla.plugins.dashboard-vim'
spec 'godzilla.plugins.dressing'
spec 'godzilla.plugins.flash'
spec 'godzilla.plugins.gitsigns'
spec 'godzilla.plugins.harpoon'
spec 'godzilla.plugins.indent'
spec 'godzilla.plugins.lazygit'
spec 'godzilla.plugins.lualine'
spec 'godzilla.plugins.neo-tree'
spec 'godzilla.plugins.neotest'
spec 'godzilla.plugins.noice'
spec 'godzilla.plugins.nvim-cmp'
spec 'godzilla.plugins.nvim-dap'
spec 'godzilla.plugins.nvim-lspconfig'
spec 'godzilla.plugins.nvim-notify'
spec 'godzilla.plugins.openingh'
spec 'godzilla.plugins.profile'
spec 'godzilla.plugins.telescope'
spec 'godzilla.plugins.toggleterm'
spec 'godzilla.plugins.treesitter'
spec 'godzilla.plugins.trouble'
spec 'godzilla.plugins.vim-tmux-navigator'
spec 'godzilla.plugins.which-key'
spec 'godzilla.plugins.zoomwintab'

require 'godzilla.config.lazy'
