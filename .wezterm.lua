local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Treehouse'
config.window_background_opacity = 1.0

config.font = wezterm.font('JetBrainsMonoNerdFont')

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations="RESIZE"

config.window_close_confirmation = 'NeverPrompt'

return config
