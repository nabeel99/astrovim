local wezterm = require("wezterm")

local config = wezterm.config_builder()

local is_windows = os.getenv("OS") and os.getenv("OS"):lower():find("windows")
local is_macos = wezterm.target_triple:lower():find("darwin") ~= nil

-- ui
config.max_fps = 120

-- gruvbox-dark-hard — same palette as base16-nvim
config.colors = {
  foreground = "#d5c4a1",
  background = "#1d2021",

  cursor_fg = "#1d2021",
  cursor_bg = "#d5c4a1",
  cursor_border = "#d5c4a1",

  ansi = {
    "#1d2021",
    "#fb4934",
    "#b8bb26",
    "#fabd2f",
    "#83a598",
    "#d3869b",
    "#8ec07c",
    "#d5c4a1",
  },

  brights = {
    "#665c54",
    "#fe8019",
    "#3c3836",
    "#504945",
    "#bdae93",
    "#ebdbb2",
    "#d65d0e",
    "#fbf1c7",
  },
}
config.font = wezterm.font("Noto Sans Mono")
-- ligatures are on by default; use { "calt", "liga" } explicitly if desired
config.harfbuzz_features = { "calt=1", "liga=1" }
config.font_size = 13.0

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.window_frame = {
  font = wezterm.font("Noto Sans Mono"),
}

config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 1.0,
}

if is_macos then
  config.window_background_opacity = 1.0
  config.macos_window_background_blur = 0
  config.font_size = 17.0
  config.window_frame.font_size = 13.0
end
r
