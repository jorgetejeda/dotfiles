local wezterm = require("wezterm")

local config = {
	macos_window_background_blur = 30,
	enable_tab_bar = true,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	native_macos_fullscreen_mode = true,
	default_cursor_style = "BlinkingUnderline",
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 60,
		right = 28,
		top = 28,
		bottom = 28,
	},

	-- font config
	font = wezterm.font("FiraCode Nerd Font Mono"),
	font_size = 16,
	line_height = 1.1,
	adjust_window_size_when_changing_font_size = false,

	-- keys config
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = false,
	keys = {
		{ key = "t", mods = "CMD|SHIFT", action = wezterm.action.ShowTabNavigator },
	},

	-- color scheme
	color_scheme = "tokyonight_night",

	-- background config (use a color instead of a gradient)
	-- background = {
	-- 	{
	-- 		source = {
	-- 			File = {
	-- 				path = "/assets/blob.gif",
	-- 				speed = 0.2,
	-- 			},
	-- 		},
	-- 		repeat_x = "NoRepeat",
	-- 		repeat_y = "NoRepeat",
	-- 		vertical_align = "Middle",
	-- 		horizontal_align = "Center",
	-- 		width = "100%",
	-- 		height = "Cover",
	-- 		opacity = 0.10,
	-- 		hsb = {
	-- 			hue = 0.9,
	-- 			saturation = 0.8,
	-- 			brightness = 0.1,
	-- 		},
	-- 	},
	-- },
	--
	window_background_opacity = 0.85,
	window_background_image_hsb = {
		brightness = 0.8,
		hue = 1.0,
		saturation = 1.0,
	},
}

return config
