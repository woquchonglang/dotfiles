-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- ban the autoformat in c,cpp,h
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "c", "cpp", "h" },
--   callback = function()
--     vim.o.autoformat = false
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
