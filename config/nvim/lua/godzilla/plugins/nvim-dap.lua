local function configureDapSessionKeys(dap)
  local keys = {
    { 'n', dap.step_over, desc = 'Debug: Step Over' },
    { 's', dap.step_into, desc = 'Debug: Step Into' },
    { 'o', dap.step_out, desc = 'Debug: Step Out' },
    { 'c', dap.continue, desc = 'Debug: Continue' },
    { 'q', dap.terminate, desc = 'Debug: Terminate' },
  }

  local function setSessionKeys()
    for i = 1, #keys do
      vim.keymap.set('n', keys[i][1], keys[i][2], { desc = keys[i]['desc'], silent = true })
    end
  end
  local function clearSessionKeys()
    if not next(dap.sessions()) then
      for i = 1, #keys do
        pcall(vim.keymap.del, 'n', keys[i][1])
      end
    end
  end

  dap.listeners.after.event_initialized['me.dap'] = setSessionKeys
  dap.listeners.after.event_terminated['me.dap'] = clearSessionKeys
  dap.listeners.after.disconnect['me.dap'] = clearSessionKeys
end

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'folke/neoconf.nvim',
  },
  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
    { "<leader>dd", function() require("dap").continue() end,                                             desc = "Debug" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
    { "<C-s>", function() require("dap").step_into() end,                                            desc = "Step Into" },
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
    local dap, dapui = require 'dap', require 'dapui'
    dapui.setup()

    -- highlight current line
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })

    -- configure signs
    vim.fn.sign_define(
      'DapStopped',
      { text = '󰁕 ', texthl = 'DiagnosticWarn', linehl = 'DapStoppedLine', numhl = 'DapStoppedLine' }
    )
    vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DiagnosticInfo' })
    vim.fn.sign_define('DapBreakpointCondition', { text = ' ', texthl = 'DiagnosticInfo' })
    vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapLogPoint', { text = '.>', texthl = 'DiagnosticInfo' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    configureDapSessionKeys(dap)

    -- pass in adapter to language mappings
    require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp', 'rust', 'gp' } })
  end,
}
