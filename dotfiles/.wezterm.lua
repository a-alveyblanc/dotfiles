local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font("Iosevka Term")
config.font_size = 12.0

return config
