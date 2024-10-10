local dap = require("dap")

return {
  "mfussenegger/nvim-dap",
  -- keys = {
  --     -- add a keymap to browshttps://github.com/cmu-db/bustub.gite plhttps://github.com/cmu-db/bustub.gitugin files
  --     -- stylua: ignore
  --     {
  --       "<f5>",
  --       function() require("dap").continue() end,
  --       desc = "launch/continue gdb",
  --     },
  -- },
  -- config = function()
  --   dap.adapters.gdb = {
  --     type = "executable",
  --     executable = {
  --       command = vim.fn.exepath("gdb"),
  --       args = { "-i", "dap" },
  --     },
  --   }
  --   dap.configurations.c = {
  --     name = "Launch file",
  --     type = "gdb",
  --     request = "launch",
  --     gdbpath = function()
  --       return "/usr/local/bin/gdb"
  --     end,
  --     cwd = "${workspaceFolder}",
  --   }
  -- end,

  -- opts = function()
  --   dap.endadapters.cppdbg = {
  --     id = "cppdbg",
  --     type = "executable",
  --     command = "/absolute/path/to/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
  --   }
  -- end,
}
