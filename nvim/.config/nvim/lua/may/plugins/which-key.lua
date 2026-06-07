return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {},
  config = function()
    local wk = require("which-key")

    wk.add({
      -- Multi-cursor (vim-multiple-cursors) — configurados via vim.g, which-key no los detecta automáticamente
      { "<C-n>", desc = "Ctrl+n → iniciar/siguiente multicursor en la palabra" },
      { "<C-p>", desc = "Ctrl+p → quitar última selección multicursor" },
      { "<C-x>", desc = "Ctrl+x → saltar coincidencia multicursor" },
      { "g<C-n>", desc = "g + Ctrl+n → multicursor en posición exacta" },
    })
  end,
}

