local wezterm = require 'wezterm'
local act = wezterm.action
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

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.leader = { key = "`", mods = "NONE", timeout_milliseconds = 1000, }
config.keys = {
	{ key = "a", mods = "LEADER", action = act{ SendString="`" }, },
	{ key = "-", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" }, },
	{ key = "=", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" }, },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left"), },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down"), },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up"), },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right"), },
	{ key = "H", mods = "LEADER", action = act{ AdjustPaneSize = { "Left", 2, } }, },
	{ key = "J", mods = "LEADER", action = act{ AdjustPaneSize = { "Down", 2, } }, },
	{ key = "K", mods = "LEADER", action = act{ AdjustPaneSize = { "Up", 2, } }, },
	{ key = "L", mods = "LEADER", action = act{ AdjustPaneSize = { "Right", 2, } }, },
	{ key = "w", mods = "LEADER", action = act.CloseCurrentPane { confirm = false }, },
}

return config

