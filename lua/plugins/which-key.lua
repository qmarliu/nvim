return {
  "folke/which-key.nvim",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["<leader>h"] = { name = "+harpoon" },
      [",s"] = { name = "+split" },
    },
  },
}
