return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false }, -- delegamos a copilot-cmp
      panel = { enabled = false },
    })
  end,
}
