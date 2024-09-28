local wezterm = require "wezterm"
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = "Tomorrow Night Eighties"
config.font = wezterm.font "Hackgen Console NF"
config.font_size = 14.0
line_height = 1.2
config.scrollback_lines = 3500
config.enable_scroll_bar = false
config.window_background_opacity = 0.9
config.mouse_bindings = {
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = act.CompleteSelection 'ClipboardAndPrimarySelection',
    },
    -- and make Cmd-Click open hyperlinks
    {
        event = { Up = {streak = 1, button = "Left" } },
        mods = "CMD",
        action = "OpenLinkAtMouseCursor",
    },
}

return config
