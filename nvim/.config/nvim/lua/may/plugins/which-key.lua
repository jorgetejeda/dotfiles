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

    -- --- PARCHE DE TRANSPARENCIA PARA WHICH-KEY ---
    -- Extraemos el fondo sólido real de Gruvbox (si no está disponible, usamos tu fondo de Ghostty)
    local ok, gruvbox_palette = pcall(require, "gruvbox.palette")
    local bg_solid = 0x282828 -- Fallback seguro (#282828)

    if ok and gruvbox_palette then
      local colors = gruvbox_palette.get_colors()
      -- Convertimos el string HEX de Gruvbox a número para la API de Neovim
      bg_solid = tonumber(colors.dark0:gsub("#", "0x")) or bg_solid
    end

    -- Forzamos a que la ventana flotante de Which-Key sea opaca
    local hl_groups = {
      WhichKey       = { bg = bg_solid },
      WhichKeyNormal = { bg = bg_solid },
      WhichKeyBorder = { fg = bg_solid, bg = bg_solid },
    }

    for hl, col in pairs(hl_groups) do
      vim.api.nvim_set_hl(0, hl, col)
    end
    -- ----------------------------------------------

    wk.add({
      -- Multi-cursor (vim-visual-multi) — configurados via vim.g, which-key no los detecta automáticamente
      { "<C-n>", desc = "Ctrl+n → seleccionar palabra / añadir siguiente ocurrencia" },
      { "<C-Down>", desc = "Ctrl+↓ → añadir cursor abajo" },
      { "<C-Up>", desc = "Ctrl+↑ → añadir cursor arriba" },
      { "\\A", desc = "\\A → seleccionar TODAS las ocurrencias" },
    })
  end,
}
