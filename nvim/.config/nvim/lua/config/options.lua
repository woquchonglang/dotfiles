-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim编码自动识别
vim.o.fileencodings = "UTF-8,gb2312,gb18030,gbk,ucs,cp936,latin1"
-- (utf - 8, gb2312, gb18030, gbk, ucs - bom, cp936, latin1)

-- 使用 vim.g 来定义全局函数
vim.g.font = "Maple Mono NF CN:h15:i"

-- copilot
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

-- MarkdownPreview
-- local function OpenMdPreview(url)
--   vim.fn.jobstart({ "firefox", "--new-window", url }, { detach = true })
-- end
-- vim.g.mkdp_browserfunc = "OpenMdPreview(url)"
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_images_path = "$HOME/Documents/obsidian_new/Attachment"
vim.g.mkdp_browser = "/usr/bin/firefox"

-- neovide配置
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.o.guifont = "Maple Mono NF CN:h15:i"
  -- 没有空闲
  vim.g.neovide_no_idle = true
  -- 退出需要确认
  vim.g.neovide_confirm_quit = false
  -- 是否全屏
  vim.g.neovide_fullscreen = false
  -- 记住以前窗口的大小
  vim.g.neovide_remember_window_size = true
  -- 使用super键位,比如<cmd>
  -- vim.g.neovide_input_use_logo = true
  -- 开启Alt和Meta按键
  --vim.g.neovide_input_macos_alt_is_meta = true
  -- 触控板死亡地带
  vim.g.neovide_touch_deadzone = 6.0
  -- 触控板拖动超时
  -- vim.g.neovide_touch_drag_timeout = 0.17
  -- 开启轨道动画
  vim.g.neovide_cursor_vfx_mode = "railgun"
  -- Animation Trail Size
  vim.g.neovide_cursor_trail_size = 0.6
  -- Animation Length
  vim.g.neovide_cursor_animation_length = 0.006

  vim.g.neovide_refresh_rate = 90
  -- 空闲刷新率
  vim.g.neovide_refresh_rate_idle = 90
  -- 透明度
  vim.g.neovide_transparency = 0.8
  -- 未聚焦时光标轮廓宽度
  vim.g.neovide_cursor_unfocused_outline_width = 0.15
  -- 窗口模糊
  vim.g.neovide_window_blurred = true

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  --键入时隐藏鼠标
  vim.g.neovide_hide_mouse_when_typing = true
end
