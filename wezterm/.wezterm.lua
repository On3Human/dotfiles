local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font 'JetBrains Mono'
config.font =
    wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 12.67
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.enable_tab_bar = false
config.default_cursor_style = 'SteadyBar'

return config
