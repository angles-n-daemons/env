-- colorschemes that I've chosen often have both a dark and a light theme
-- as well as cover varying highlights on things like dap, dashboard and others

return {
  { 'ellisonleao/gruvbox.nvim', lazy = false, priority = 1000, config = true },
  { 'NLKNguyen/papercolor-theme', lazy = false, priority = 1000, config = function() end },
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {} },
  { 'catppuccin/nvim', name = 'catppuccin', lazy = false, priority = 1000 },
  { 'savq/melange-nvim', lazy = false, priority = 1000 },
  { 'e-q/okcolors.nvim', name = 'okcolors', lazy = false, priority = 1000 },
  { 'zortax/three-firewatch', lazy = false, priority = 1000 },
  { 'miikanissi/modus-themes.nvim', lazy = false, priority = 1000 },
}
