-- You have to install ripgrep to use the live_grep feature
-- brew install ripgrep
-- Description: Telescope plugin to find files, grep, and search for todos
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- --- SOLUCIÓN DE ISSUE #3535: CONFIGURACIÓN DINÁMICA POR EVENTO ---
    -- Creamos un grupo de autocomandos para Telescope
    local telescope_colors = vim.api.nvim_create_augroup("TelescopeColors", { clear = true })

    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeFindPre", -- Se ejecuta JUSTO ANTES de que se pinte Telescope en pantalla
      group = telescope_colors,
      callback = function()
        -- 1. Intentamos obtener la paleta real guardada internamente por tu colorscheme (Gruvbox/Kanagawa)
        -- Aunque el tema esté en modo transparente, podemos extraer sus colores estructurales de 'NormalNC' o 'Pmenu'
        local hl_target = vim.api.nvim_get_hl(0, { name = "NormalNC" })
        if not hl_target.bg then
          hl_target = vim.api.nvim_get_hl(0, { name = "Pmenu" })
        end

        -- 2. Si conseguimos el ID numérico del color base del tema, lo usamos. 
        -- De lo contrario, usamos un Fallback forzado a tu color hexadecimal de Ghostty (#282828 convertido a entero)
        local theme_bg = (type(hl_target.bg) == "number") and hl_target.bg or 0x282828
        local prompt_bg = 0x1d1d1d -- Tu Palette 8 de Ghostty para el input de búsqueda

        -- 3. Inyectamos los Overrides opacos pisando la transparencia asíncrona del tema
        local hl_groups = {
          TelescopeNormal        = { bg = theme_bg },
          TelescopeBorder        = { fg = theme_bg, bg = theme_bg },
          
          TelescopePromptNormal  = { bg = prompt_bg },
          TelescopePromptBorder  = { fg = prompt_bg, bg = prompt_bg },
          TelescopePromptTitle   = { fg = 0xffc24b, bg = prompt_bg, bold = true }, -- Amarillo de tu paleta

          TelescopePreviewNormal = { bg = theme_bg },
          TelescopePreviewBorder = { fg = theme_bg, bg = theme_bg },
          TelescopePreviewTitle  = { fg = 0xc9d05c, bg = theme_bg, bold = true }, -- Verde de tu paleta
        }

        for hl, col in pairs(hl_groups) do
          vim.api.nvim_set_hl(0, hl, col)
        end
      end,
    })
    -- -----------------------------------------------------------------

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        get_selection_window = function()
          local zen = package.loaded["zen-mode.view"]
          if zen and zen.is_open() then
            return zen.win
          end
          return 0
        end,
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
