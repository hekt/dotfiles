local wezterm = require "wezterm"

local config = wezterm.config_builder()

config.color_scheme = "Tomorrow Night Eighties"
config.font = wezterm.font "Hackgen Console NF"
config.font_size = 14.0
line_height = 1.2
config.scrollback_lines = 3500
config.enable_scroll_bar = false
config.window_background_opacity = 0.9

return config
