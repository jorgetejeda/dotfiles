return {
  "chentoast/marks.nvim",
  config = true,
  opts = {
    disable_mappings = false,
    mappings = {
      toggle = "<leader>m",
      set_next = "<leader>m",
      next = "m,",
      prev = "m.",
      preview = "m;",
      delete_buf = "m-",
    },
  },
}
