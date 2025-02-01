local type_to_filetypes = {
  ["cppdbg"] = { "cpp", "c" },
  ["python"] = { "python" },
  ["node"] = { "javascript", "typescript" },
  ["go"] = { "go" },
  ["rust"] = { "rust" },
  -- Add more mappings as needed
}

return {
  "jedrzejboczar/nvim-dap-cortex-debug",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
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

    -- require("dap.ext.vscode").json_decode = require("json5").parse
    -- require("dap.ext.vscode").load_launchjs(nil, type_to_filetypes)
    require("dap").configurations.c = {
      require("dap-cortex-debug").openocd_config({
        name = "debug with OpenOCD",
        cwd = "${workspaceFolder}",
        executable = "${workspaceFolder}/build/robot.elf",
        configFiles = {
          "interface/cmsis-dap.cfg",
          "target/stm32h7x.cfg",
        },
        gdbTarget = "localhost:3333",
        rttConfig = require("dap-cortex-debug").rtt_config(0),
        showDevDebugOutput = true,
      }),
    }
    require("dap").configurations.c = require("dap").configurations.cpp

    require("dapui").setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = "",
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
      },
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.15,
            },
            {
              id = "watches",
              size = 0.70,
            },
            {
              id = "breakpoints",
              size = 0.05,
            },
            {
              id = "stacks",
              size = 0.10,
            },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 10,
        },
      },
      mappings = {
        edit = "e",
        expand = { "<TAB>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
      -- layouts = {
      --   {
      --     position = "right",
      --     size = 48,
      --     elements = {
      --       { id = "scopes", size = 0.4 },
      --       { id = "rtt", size = 0.4 },
      --     },
      --   },
      --   -- (...)
      -- },
    })
  end,
}
