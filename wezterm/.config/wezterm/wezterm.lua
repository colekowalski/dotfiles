local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Slightly transparent and blurred background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
config.kde_window_background_blur = true
config.win32_system_backdrop = "Mica"

-- Remove the title bar, leaving only the tab bar and system-integrated buttons
config.window_decorations = 'RESIZE'
config.window_frame = {
  font_size = 12
}

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 13.0

config.color_scheme = 'Tokyo Night'

return config
