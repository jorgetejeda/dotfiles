return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
  },
}

-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   event = { "BufReadPre", "BufNewFile" },
--   main = "ibl",
--   opts = {
--     indent = { char = "┊" },
--   },
--   config = function(_, opts)
--     -- 1. Definimos la lista de colores basados en rainbow-delimiters
--     local highlight = {
--       "RainbowRed",
--       "RainbowYellow",
--       "RainbowBlue",
--       "RainbowOrange",
--       "RainbowGreen",
--       "RainbowViolet",
--       "RainbowCyan",
--     }
--
--     -- 2. Usamos los hooks integrados del plugin para registrar los highlights
--     local hooks = require("ibl.hooks")
--     hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--       vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
--       vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--       vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--       vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--       vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--       vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--       vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
--     end)
--
--     -- 3. Le pasamos la lista de colores a la configuración de indentación
--     opts.indent.highlight = highlight
--
--     -- 4. Ejecutamos el setup original de ibl con las opciones completas
--     require("ibl").setup(opts)
--   end,
-- }
