return {
  "tris203/precognition.nvim",
  event = "BufEnter",
  opts = {
    startVisible = true,
  },
  keys = {
    {
      "<leader>mp",
      function() require("precognition").toggle() end,
      desc = "Toggle Precognition hints",
    },
  },
}
