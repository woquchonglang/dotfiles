-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<Tab>", "za")
keymap.set("n", "<C-S-c>", ":CopilotChatOpen<CR>")

-- neovide
if vim.g.neovide then
  keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

-- EmojiPicker
vim.keymap.set("i", "<A-e>", "<cmd>EmojiPicker<cr>")

-- EmojiPicker
vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)

-- comment_box
-- Titles
keymap.set({ "n", "v" }, "<C-c>", "<Cmd>CBclbox10<CR>", opts)
-- Named parts
keymap.set({ "n", "v" }, "<Leader>ct", "<Cmd>CBccline9<CR>", opts)
-- Simple line
keymap.set("n", "<Leader>cl", "<Cmd>CBline8<CR>", opts)
-- keymap("i", "<M-l>", "<Cmd>CBline<CR>", opts) -- To use in Insert Mode
-- Marked comments
keymap.set({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)

-- Removing a box is simple enough with the command (CBd), but if you
-- use it a lot:
-- keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)

-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- barbar
-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
--
-- -- Move to previous/next
-- map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
-- map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- -- Re-order to previous/next
-- map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
-- map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- -- Goto buffer in position...
-- map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
-- map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
-- map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
-- map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
-- map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
-- map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
-- map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
-- map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
-- map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
-- map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- -- Pin/unpin buffer
-- map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- -- Goto pinned/unpinned buffer
-- --                 :BufferGotoPinned
-- --                 :BufferGotoUnpinned
-- -- Close buffer
-- map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- -- Wipeout buffer
-- --                 :BufferWipeout
-- -- Close commands
-- --                 :BufferCloseAllButCurrent
-- --                 :BufferCloseAllButPinned
-- --                 :BufferCloseAllButCurrentOrPinned
-- --                 :BufferCloseBuffersLeft
-- --                 :BufferCloseBuffersRight
-- -- Magic buffer-picking mode
-- map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- -- Sort automatically by...
-- map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
-- map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
-- map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
-- map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
-- map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
--
-- -- Other:
-- -- :BarbarEnable - enables barbar (enabled by default)
-- -- :BarbarDisable - very bad command, should never be used
