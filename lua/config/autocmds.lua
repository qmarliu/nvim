-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 用o换行不要延续注释
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set formatoptions-=o",
})
