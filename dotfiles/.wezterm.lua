local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

if wezterm.target_triple:find("windows") ~= nil then
    config.default_prog = { "pwsh.exe", "-NoLogo", }
end

config.color_scheme = 'carbonfox'
config.window_background_opacity = 0.8
config.font_size = 10
config.font = wezterm.font 'Mononoki Nerd Font Mono'

return config

