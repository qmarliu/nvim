return {
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = "hrsh7th/nvim-cmp",
  opts = {
    max_lines = 1000,
    max_num_results = 3,
    sort = true,
  },
}
