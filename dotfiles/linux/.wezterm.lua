local wezterm = require 'wezterm'
config = wezterm.config_builder()

config.color_scheme = 'carbonfox'

config.window_background_opacity = 0.8

config.font_size = 10
config.font = wezterm.font 'Mononoki Nerd Font Mono'

return config

