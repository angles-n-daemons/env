return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'folke/neoconf.nvim',
  },
  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
    { "<C-c>",      function() require("dap").continue() end,                                             desc = "Continue" },
    { "<leader>dd", function() require("dap").continue() end,                                             desc = "Debug" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
    { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
    { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
    { "<C-n>",      function() require("dap").step_over() end,                                            desc = "Step Over" },
    { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
    { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Close" },
    { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
    { "<F7>",       function() require('dapui').toggle() end,                                             desc = "Debug: see last sessions result" },
    -- requires neotest to be installed
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,                      desc = "Debug Nearest" },
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

    -- highlight current line
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    -- configure signs
    vim.fn.sign_define('DapStopped',
      { text = '󰁕 ', texthl = 'DiagnosticWarn', linehl = 'DapStoppedLine', numhl = 'DapStoppedLine' })
    vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DiagnosticInfo' })
    vim.fn.sign_define('DapBreakpointCondition', { text = ' ', texthl = 'DiagnosticInfo' })
    vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapLogPoint', { text = '.>', texthl = 'DiagnosticInfo' })

    require('mason-nvim-dap').setup {
      automatic_installation = true,
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
    -- TODO: setup loading launch json
  end,
}
-- 'leoluz/nvim-dap-go',
--
-- You'll need to check that you have the required things installed
-- online, please don't ask me how to install them :)
-- ensure_installed = {
--   -- Update this to ensure that you have the debuggers for the langs you want
--   'delve',
-- },
--
-- -- Install golang specific config
-- require('dap-go').setup {
--   delve = {
--     -- On Windows delve must be run attached or it crashes.
--     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
--     detached = vim.fn.has 'win32' == 0,
--   },
-- }
