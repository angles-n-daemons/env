-- remap semicolon to colon
vim.keymap.set('n', ';', ':')
-- set leader to space
vim.g.mapleader = ' '
-- set localleader to \
vim.g.maplocalleader = '\\'

require('config.lazy')
require('config.keymaps')
require('config.autocmds')
require('config.options')

-- set the primary colorscheme
vim.cmd('colorscheme tokyonight')

-- TODO: get rid of the below
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
