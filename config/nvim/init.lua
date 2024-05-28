-- remap semicolon to colon
vim.keymap.set('n', ';', ':')
-- set leader to space
vim.g.mapleader = ' '
-- set localleader to \
vim.g.maplocalleader = '\\'

require 'config.languages'
require 'config.lazy'
require 'config.keymaps'
require 'config.autocmds'
require 'config.options'
require 'config.colors'

-- TODO: get rid of the below
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
