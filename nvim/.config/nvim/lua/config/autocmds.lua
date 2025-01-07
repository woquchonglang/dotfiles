-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- cmake no indent
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cmake",
  callback = function()
    print("CMake file detected")
    -- vim.bo.autoindent = false
    -- vim.bo.smartindent = false
    vim.bo.cindent = false
    -- vim.bo.indentexpr  = ""
  end,
})

vim.opt.laststatus = 0
vim.api.nvim_set_hl(0, "Statusline", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatuslineNC", { link = "Normal" })
