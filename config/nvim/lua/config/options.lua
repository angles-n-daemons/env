-- look into lazy and kickstart options

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- set leader to space
vim.g.mapleader = ' '
-- set localleader to \
vim.g.maplocalleader = '\\'

-- TODO: get rid of the below
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
