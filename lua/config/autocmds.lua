-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 用o换行不要延续注释
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set formatoptions-=o",
})

-- / ? 搜索时，默认不开启flash.nvim。不然文件大的时候，会导致卡顿
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = { "/", "?" },
  callback = function()
    require("flash").toggle(false)
  end,
})
