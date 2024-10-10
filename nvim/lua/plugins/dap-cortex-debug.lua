local type_to_filetypes = {
  ["cppdbg"] = { "cpp", "c" },
  ["python"] = { "python" },
  ["node"] = { "javascript", "typescript" },
  ["go"] = { "go" },
  ["rust"] = { "rust" },
  -- Add more mappings as needed
}

-- local dap_cortex_debug = require("dap-cortex-debug")

return {
  "jedrzejboczar/nvim-dap-cortex-debug",
  config = function()
    require("dap-cortex-debug").setup({
      debug = false, -- log debug messages
      -- path to cortex-debug extension, supports vim.fn.glob
      -- by default tries to guess: mason.nvim or VSCode extensions
      extension_path = "$HOME/.vscode/extensions/marus25.cortex-debug-1.12.1/",
      lib_extension = nil, -- shared libraries extension, tries auto-detecting, e.g. 'so' on unix
      node_path = "/usr/bin/node", -- path to node.js executable
      dapui_rtt = true, -- register nvim-dap-ui RTT element
      -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
      rtt = {
        buftype = "Terminal", -- 'Terminal' or 'BufTerminal' for terminal buffer vs normal buffer
      },
      dap_vscode_filetypes = { "c", "cpp" },
    })

    local dap_cortex_debug = require("dap-cortex-debug")
    -- require("dap.ext.vscode").json_decode = require("json5").parse
    -- require("dap.ext.vscode").load_launchjs(nil, type_to_filetypes)
    require("dap").configurations.c = {
      require("dap-cortex-debug").openocd_config({
        name = "debugging with OpenOCD",
        cwd = "${workspaceFolder}",
        executable = "${workspaceFolder}/cmake-build-debug/board_c.elf",
        configFiles = {
          "interface/cmsis-dap.cfg",
          "target/stm32f4x.cfg",
        },
        gdbTarget = "localhost:3333",
        ToolchainPath = "/home/yjy/apps/arm-gnu-toochain/bin",
        rttConfig = dap_cortex_debug.rtt_config(0),
        showDevDebugOutput = false,
      }),
    }
  end,
}
