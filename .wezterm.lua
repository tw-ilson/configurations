local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- config.front_end = "OpenGL"

config.color_scheme = 'Treehouse'

config.window_background_opacity = 1.0

-- config.font = wezterm.font('UbuntuMono Nerd Font')

config.font_size = 12.0

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations="RESIZE"

config.window_close_confirmation = 'NeverPrompt'

config.initial_cols = 112
config.initial_rows = 46

config.window_frame = {
  border_left_width = '1px',
  border_right_width = '1px',
  border_bottom_height = '1px',
  border_top_height = '1px',
  border_left_color = 'grey',
  border_right_color = 'grey',
  border_bottom_color = 'grey',
  border_top_color = 'grey',
}

config.warn_about_missing_glyphs = false

config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Pane Splitting
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '"',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Pane navigation (vim-style)
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },

  -- Pane resizing
  {
    key = 'H',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'J',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  {
    key = 'K',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'L',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },

  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

config.unix_domains = {
  {
    name = 'unix',
  },
}

config.default_gui_startup_args = { 'connect', 'unix' }

return config
