local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12
config.color_scheme = "Tokyo Night"
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_background_opacity = 0.8
config.term = "xterm-256color" -- Ensure compatibility with true colors

return config
