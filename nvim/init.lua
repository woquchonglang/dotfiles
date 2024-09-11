-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
<<<<<<< HEAD
--
-- require("glow").setup({
--   style = "dracula",
--   width = 120,
-- })
--
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
=======
>>>>>>> efc51af (add the dotfiles)

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  -- 没有空闲
  vim.g.neovide_no_idle = true
  -- 退出需要确认
<<<<<<< HEAD
  vim.g.neovide_confirm_quit = false
  -- 是否全屏
  vim.g.neovide_fullscreen = false
=======
  vim.g.neovide_confirm_quit = true
  -- 是否全屏
  vim.g.neovide_fullscreen = true
>>>>>>> efc51af (add the dotfiles)
  -- 记住以前窗口的大小
  vim.g.neovide_remember_window_size = true
  -- 使用super键位,比如<cmd>
  -- vim.g.neovide_input_use_logo = true
  -- 开启Alt和Meta按键
  --vim.g.neovide_input_macos_alt_is_meta = true
  -- 触控板死亡地带
  -- vim.g.neovide_touch_deadzone = 6.0
  -- 触控板拖动超时
  -- vim.g.neovide_touch_drag_timeout = 0.17
  -- 开启轨道动画
  vim.g.neovide_cursor_vfx_mode = "railgun"

<<<<<<< HEAD
  vim.g.neovide_refresh_rate = run_fps
  -- 空闲刷新率
  vim.g.neovide_refresh_rate_idle = free_fps
  -- 透明度
  vim.g.neovide_transparency = 0.85
=======
  vim.g.neovide_refresh_rate = 60
  -- 空闲刷新率
  vim.g.neovide_refresh_rate_idle = 60
  -- 透明度
  vim.g.neovide_transparency = 0.9
>>>>>>> efc51af (add the dotfiles)
  -- 未聚焦时光标轮廓宽度
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  -- 窗口模糊
  vim.g.neovide_window_blurred = true

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  --键入时隐藏鼠标
  vim.g.neovide_hide_mouse_when_typing = true
end
