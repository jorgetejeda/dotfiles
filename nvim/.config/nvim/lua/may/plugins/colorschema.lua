-- return {
--   {
--     "sainnhe/sonokai",
--     priority = 1000,
--     config = function()
--       vim.g.sonokai_transparent_background = "1"
--       vim.g.sonokai_enable_italic = "1"
--       vim.g.sonokai_style = "andromeda"
--       vim.cmd.colorscheme("sonokai")
--     end,
--   },
-- }
--
-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     opts = {
--       transparent_background = true,
--       integrations = {
--         aerial = true,
--         alpha = true,
--         cmp = true,
--         dashboard = true,
--         flash = true,
--         gitsigns = true,
--         headlines = true,
--         illuminate = true,
--         indent_blankline = { enabled = true },
--         leap = true,
--         lsp_trouble = true,
--         mason = true,
--         markdown = true,
--         mini = true,
--         native_lsp = {
--           enabled = true,
--           underlines = {
--             errors = { "undercurl" },
--             hints = { "undercurl" },
--             warnings = { "undercurl" },
--             information = { "undercurl" },
--           },
--         },
--         navic = { enabled = true, custom_bg = "lualine" },
--         neotest = true,
--         neotree = true,
--         noice = true,
--         semantic_tokens = true,
--         telescope = true,
--         treesitter = true,
--         treesitter_context = true,
--         which_key = true,
--       },
--     },
--     config = function(_, opts)
--       require("catppuccin").setup(opts)
--       vim.cmd.colorscheme("catppuccin-macchiato")
--     end,
--   },
-- }
--
--

-- return {
--   {
--     "folke/tokyonight.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       local bg = "#011628"
--       local bg_dark = "#011423"
--       local bg_highlight = "#143652"
--       local bg_search = "#0A64AC"
--       local bg_visual = "#275378"
--       local fg = "#CBE0F0"
--       local fg_dark = "#B4D0E9"
--       local fg_gutter = "#627E97"
--       local border = "#547998"
--
--       require("tokyonight").setup({
--         style = "night",
--         on_colors = function(colors)
--           colors.bg = bg
--           colors.bg_dark = bg_dark
--           colors.bg_float = bg_dark
--           colors.bg_highlight = bg_highlight
--           colors.bg_popup = bg_dark
--           colors.bg_search = bg_search
--           colors.bg_sidebar = bg_dark
--           colors.bg_statusline = bg_dark
--           colors.bg_visual = bg_visual
--           colors.border = border
--           colors.fg = fg
--           colors.fg_dark = fg_dark
--           colors.fg_float = fg
--           colors.fg_gutter = fg_gutter
--           colors.fg_sidebar = fg_dark
--         end,
--       })
--       -- load the colorscheme here
--       vim.cmd([[colorscheme tokyonight]])
--     end,
--   },
-- }
return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- Mapea tus colores ANSI de Ghostty a la terminal interna de Neovim
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,

			-- --- TRANSPARENCIA NATIVA ---
			transparent_mode = true, -- Activa la transparencia base de Gruvbox

			-- --- AJUSTES DE PALETA (Para calzar con tu Ghostty) ---
			palette_overrides = {
				dark0 = "#282828", -- Tu fondo exacto
				dark1 = "#1d1d1d", -- Tu Palette 8
			},

			-- --- OVERRIDES DE INTERFAZ TRANSPARENTE ---
			overrides = {
				-- Asegura transparencia total en columnas laterales y números
				SignColumn = { bg = "none" },
				FoldColumn = { bg = "none" },
				LineNr = { bg = "none" },
				CursorLineNr = { bg = "none" },

				-- Ventanas flotantes y menús de autocompletado transparentes
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				Pmenu = { bg = "none" },
				PmenuSel = { bg = "#293b44", fg = "#eeeeee" }, -- Tu color de selección de Ghostty

				-- Bordes de divisiones verticales limpios
				WinSeparator = { bg = "none" },
				-- =================================================================
				-- --- BLOQUE DE OPACIDAD PARA NVIM-TREE ---
				-- =================================================================
				NvimTreeNormal = { bg = "#282828" },
				NvimTreeNormalNC = { bg = "#282828" },
				NvimTreeWinSeparator = { fg = "#282828", bg = "#282828" },
				NvimTreeEndOfBuffer = { fg = "#282828", bg = "#282828" },
				-- =================================================================
				-- --- BLOQUE DE OPACIDAD PARA LAZYGIT ---
				-- Forzamos el fondo sólido de Gruvbox en el buffer de la terminal de Git
				-- =================================================================
				LazyGitNormal = { bg = "#282828" },
				LazyGitBorder = { fg = "#282828", bg = "#282828" },
				LazyGitFloat = { bg = "#282828" },
				-- =================================================================
				-- --- BLOQUE DE OPACIDAD PARA LAZY.NVIM ---
				-- Forzamos el fondo sólido de Gruvbox cuando ejecutas :Lazy
				-- =================================================================
				LazyNormal = { bg = "#282828" },
				LazyBorder = { fg = "#1d1d1d", bg = "#282828" },
				-- --- COPIAR ESTO DENTRO DE LOS OVERRIDES DE TU COLORSCHEME ---
				-- --- Mantiene los fondos sólidos y los colores vivos del texto ---
				NoiceCmdline = { bg = "#282828" },
				NoiceCmdlinePopup = { bg = "#282828" },
				NoiceCmdlinePopupTitle = { fg = "#ffc24b", bold = true },
				NoiceCmdlineIcon = { fg = "#f43753", bg = "#282828" },
				NoiceCompletion = { bg = "#282828" },
			},
		})

		-- Cargar el esquema de colores
		vim.cmd("colorscheme gruvbox")
	end,
}
