-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local dap_cortex_debug = require("dap-cortex-debug")
require("dap").configurations.c = {
  dap_cortex_debug.openocd_config({
    name = "neovim_cortex_debug",
    cwd = "${workspaceFolder}",
    executable = "${workspaceFolder}/cmake-build-debug/board_c.elf",
    -- configFiles = { "${workspaceFolder}/build/openocd/connect.cfg" },
    gdbTarget = "localhost:3333",
    rttConfig = dap_cortex_debug.rtt_config(0),
    showDevDebugOutput = false,
  }),
}
