-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use `vim.keymap.set` instead
local map = vim.api.nvim_set_keymap

local opt = {
  noremap = true,
  silent = true,
}

map("v", "q", "<cmd>noh<cr><ESC>", opt)
map("!", "<C-q>", "<cmd>noh<cr><ESC>", { noremap = true })

map("n", "<C-q>", ":qa<CR>", opt)

map("i", "<C-a>", 'copilot#Accept("<CR>") ? "<CR>" : "<C-a>"', { expr = true, silent = true })

-- hardppon
map("n", "<leader>ha", '<cmd>lua require("harpoon.mark").add_file()<cr>', opt)
map("n", "<leader>hn", '<cmd>lua require("harpoon.ui").nav_next()<cr>', opt)
map("n", "<leader>hp", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', opt)
map("n", "<leader>he", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', opt)
-- map("n", "<leader>hc", "<cmd>Telescope harpoon marks)<cr>", opt)
map("n", "<leader>h1", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', opt)
map("n", "<leader>h2", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', opt)
map("n", "<leader>h3", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', opt)
map("n", "<leader>h4", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', opt)
map("n", "<leader>h5", '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', opt)
map("n", "<leader>h6", '<cmd>lua require("harpoon.ui").nav_file(6)<cr>', opt)
map("n", "<leader>h7", '<cmd>lua require("harpoon.ui").nav_file(7)<cr>', opt)
map("n", "<leader>h8", '<cmd>lua require("harpoon.ui").nav_file(8)<cr>', opt)
map("n", "<leader>h9", '<cmd>lua require("harpoon.ui").nav_file(9)<cr>', opt)

map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("n", ",", "", opt)
map("n", ",sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opt)
map("n", ",sj", ":set splitbelow<CR>:split<CR>", opt)
map("n", ",sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opt)
map("n", ",sl", ":set splitright<CR>:vsplit<CR>", opt)
-- , + hjkl 窗口之间跳转
map("n", ",h", "<C-w>h", opt)
map("n", ",j", "<C-w>j", opt)
map("n", ",k", "<C-w>k", opt)
map("n", ",l", "<C-w>l", opt)
map("n", "_", ":vertical resize -10<CR>", opt)
map("n", "+", ":vertical resize +10<CR>", opt)

map("n", ",", '<Cmd>lua require("which-key").show(",", {mode = "n", auto = true})<CR>', opt)
