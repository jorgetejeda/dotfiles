local wezterm = require("wezterm")
local act = wezterm.action
local config = {} 

-- UI & Window Config
config.macos_window_background_blur = 30
config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.native_macos_fullscreen_mode = true
config.default_cursor_style = "BlinkingUnderline"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
    left = 0,
    right = 0,
    top = 20,
    bottom = 0,
}

-- Font Config — switch between FiraCode and JetBrains by toggling the active line
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14
config.line_height = 1.1
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.adjust_window_size_when_changing_font_size = false

-- Alts Config
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Tamaño de la fuente para las etiquetas de selección de panes
config.pane_select_font_size = 36

-- Color Scheme
config.color_scheme = "tokyonight_night"

-- Background Config
config.background = {
    {
        source = {
            File = {
                path = wezterm.home_dir .. "/.config/wezterm/assets/blob.gif",
            },
        },
        repeat_x = "NoRepeat",
        repeat_y = "NoRepeat",
        vertical_align = "Middle",
        horizontal_align = "Center",
        width = "100%",
        height = "Cover", --Cover, Contain, 123 specific pixels, 20% percentage, 
        opacity = 1.00,
        hsb = {
            hue = 0.9,
            saturation = 0.8,
            brightness = 0.1,
        },
    },
}

config.window_background_opacity = 0.85
config.window_background_image_hsb = {
    brightness = 0.8,
    hue = 1.0,
    saturation = 1.0,
}

return config
