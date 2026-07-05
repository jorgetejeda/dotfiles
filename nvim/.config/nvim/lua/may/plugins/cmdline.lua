-- lazy.nvim
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- Habilitar el cmdline popup explícitamente en el setup de noice
		cmdline = { enabled = true },
		popupmenu = { enabled = true },

		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
				-- =================================================================
				-- --- CONFIGURACIÓN PARA EL LOOK DE TELESCOPE (SIN BORDES) ---
				-- =================================================================
				border = {
					style = "none", -- Eliminamos las líneas físicas del borde por completo
					padding = { 1, 2 }, -- Le damos aire interno para que respire igual que Telescope
				},
				win_options = {
					-- Forzamos a que la ventana use el fondo sólido y que dibuje el título
					winhighlight = {
						Normal = "NoiceCmdlinePopup",
						FloatTitle = "NoiceCmdlinePopupTitle",
					},
				},
				-- =================================================================
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "none", -- También quitamos las líneas al menú de sugerencias para consistencia
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = {
						Normal = "NoiceCompletion",
						FloatBorder = "NoiceCompletionBorder",
					},
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				background_colour = "#000000",
				timeout = 2000, -- auto-ocultar tras 2s (default era 5s)
			},
		},
	},
}
