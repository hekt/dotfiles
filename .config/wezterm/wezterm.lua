local wezterm = require "wezterm"
local act = wezterm.action
local config = wezterm.config_builder()

-- see: https://wezfurlong.org/wezterm/config/lua/config/term.html
config.term = "wezterm"
config.color_scheme = "Tomorrow Night Eighties"
config.font = wezterm.font "Hackgen Console NF"
config.font_size = 14.0
config.line_height = 1.25
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 3500
config.enable_scroll_bar = false
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.native_macos_fullscreen_mode = true
config.swallow_mouse_click_on_pane_focus = true
config.swallow_mouse_click_on_window_focus = true
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.5cell",
}
config.initial_cols = 100
config.initial_rows = 24
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
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CMD",
        action = "OpenLinkAtMouseCursor",
    },
}
config.keys = {
    -- open new window with home directory
    {
        key = "n",
        mods = "CMD",
        action = act.SpawnCommandInNewWindow { cwd = wezterm.home_dir },
    },
    -- open new tab with home directory
    {
        key = 't',
        mods = "CMD",
        action = act.SpawnCommandInNewTab { cwd = wezterm.home_dir },
    },
}

return config
