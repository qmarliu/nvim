return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
    },
  },
  keys = {
    { ";", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
  },
}
