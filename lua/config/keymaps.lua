-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use `vim.keymap.set` instead
local map = vim.api.nvim_set_keymap

local opt = {
  noremap = true,
  silent = true,
}

map("v", "q", "<ESC>", opt)
map("!", "<C-q>", "<ESC>", { noremap = true })

map("n", "<C-q>", ":qa<CR>", opt)
