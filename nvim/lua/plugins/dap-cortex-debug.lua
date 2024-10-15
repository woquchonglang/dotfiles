-- local dap_cortex_debug = require("dap-cortex-debug")

return {
  "jedrzejboczar/nvim-dap-cortex-debug",
  opts = {
    debug = false, -- log debug messages
    -- path to cortex-debug extension, supports vim.fn.glob
    -- by default tries to guess: mason.nvim or VSCode extensions
    extension_path = nil,
    lib_extension = nil, -- shared libraries extension, tries auto-detecting, e.g. 'so' on unix
    node_path = "node", -- path to node.js executable
    dapui_rtt = true, -- register nvim-dap-ui RTT element
    -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
    dap_vscode_filetypes = { "c", "cpp" },
  },
  config = function()
    -- require("dap-cortex-debug").configurations.c = {
    -- require("dap-cortex-debug").openocd_config({
    -- name = "Example debugging with OpenOCD",
    -- cwd = "${workspaceFolder}",
    -- executable = "${workspaceFolder}/build/app",
    -- configFiles = { "${workspaceFolder}/build/openocd/connect.cfg" },
    -- gdbTarget = "localhost:3333",
    -- rttConfig = require(" dap-cortex-debug").rtt_config(0),
    -- showDevDebugOutput = false,
    -- }),
    -- }
  end,
}
