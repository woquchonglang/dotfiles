-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font:h10"
  -- 没有空闲
  vim.g.neovide_no_idle = true
  -- 退出需要确认
  vim.g.neovide_confirm_quit = true
  -- 是否全屏
  vim.g.neovide_fullscreen = true
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

  vim.g.neovide_refresh_rate = run_fps
  -- 空闲刷新率
  vim.g.neovide_refresh_rate_idle = free_fps
  -- 透明度
  vim.g.neovide_transparency = 0.85
  -- 未聚焦时光标轮廓宽度
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
end
