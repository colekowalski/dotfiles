local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Slightly transparent and blurred background
config.window_background_opacity = 0.9

-- Platform-specific background blur settings
if wezterm.target_triple:find("darwin") then
  config.macos_window_background_blur = 30
elseif wezterm.target_triple:find("linux") then
  config.enable_wayland = false
  -- config.kde_window_background_blur = true
elseif wezterm.target_triple:find("windows") then
  config.win32_system_backdrop = "Mica"
end

-- Remove the title bar, leaving only the tab bar and system-integrated buttons
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.window_frame = {
  font_size = 12
}

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 13.0

config.color_scheme = 'Tokyo Night'

-- Load machine-specific configuration if it exists
local ok, local_config = pcall(require, 'local')
if ok and local_config then
  for k, v in pairs(local_config) do
    config[k] = v
  end
end

return config
