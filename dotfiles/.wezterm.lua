local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('Iosevka')
config.font_size = 12.0

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

return config
