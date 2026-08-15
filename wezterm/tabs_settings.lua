local wezterm = require('wezterm')
local tabs_settings = {}

local LEFT_END = utf8.char(0xE0B6)
local RIGHT_END = utf8.char(0xE0B4)
local active_tab_bg_color = '#FFA066'
local inactive_tab_text_color = '#526F76'
local active_tab_fg_color = '#22222B'
local inactive_tab_bg_color = '#22222B'

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

-- Registered once at module load, not inside apply_to_config,
-- so hot-reloads don't stack duplicate listeners.
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab_title(tab)
  title = wezterm.truncate_right(title, max_width - 2)

  local main_bg_color = '#22222B'
  local background = '#22222B'
  local tab_icon_inactive = '#495267'
  local tab_icon_inactive_icon = wezterm.nerdfonts.md_ghost_off_outline
  local tab_icon_active_icon = wezterm.nerdfonts.md_ghost

  local icon_text = ''
  local tab_icon_color = ''
  local tab_text_color = ''
  local tab_background_color = ''

  if tab.is_active then
    tab_icon_color = active_tab_fg_color
    tab_text_color = active_tab_fg_color
    tab_background_color = active_tab_bg_color
    icon_text = tab_icon_active_icon
  else
    tab_icon_color = tab_icon_inactive
    tab_text_color = inactive_tab_text_color
    icon_text = tab_icon_inactive_icon
    tab_background_color = inactive_tab_bg_color
  end

  return {
    { Background = { Color = main_bg_color } },
    { Foreground = { Color = tab_background_color } },
    { Text = LEFT_END },
    { Background = { Color = tab_background_color } },
    { Foreground = { Color = tab_icon_color } },
    { Text = ' ' .. icon_text .. ' ' },
    { Background = { Color = tab_background_color } },
    { Foreground = { Color = tab_text_color } },
    { Text = title .. '  ' },
    { Background = { Color = background } },
    { Foreground = { Color = tab_background_color } },
    { Text = RIGHT_END },
  }
end)

function tabs_settings.apply_to_config(config)
  config.use_fancy_tab_bar = true
  config.show_new_tab_button_in_tab_bar = false
  config.tab_and_split_indices_are_zero_based = false
end

return tabs_settings
