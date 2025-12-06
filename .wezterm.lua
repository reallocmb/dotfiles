local wezterm = require 'wezterm'

local config = {}

-- Farbtheme
config.color_scheme = 'Dracula'

-- Schriftart + Größe
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 11.0

-- Fensterverhalten
--config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- Standard-Shell (PowerShell)
config.default_prog = { "cmd.exe" }

config.window_background_opacity = 1

return config
