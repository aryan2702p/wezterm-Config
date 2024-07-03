-- -- local wezterm = require('wezterm')
-- -- local ssh_domains = require('extra.ssh') 
-- -- return {
-- -- 	-- color scheme
-- -- 	color_scheme = "Banana Blueberry",
-- -- 	--window opacity reduced
-- -- 	window_background_opacity = .85,
-- -- 	-- make sure you use a font you have installed
-- -- 	font = wezterm.font 'NotoSansMono Nerd Font',
-- -- 	font_size = 10.5,
-- -- 	-- scroll bar
-- -- 	enable_scroll_bar = true,
-- -- 	-- Custom Key Bindings
-- -- 	-- disable_default_key_bindings = true,
-- -- 	ssh_domains = ssh_domains,
-- -- }
-- local wezterm = require("wezterm")
-- -- local mux = wezterm.mux
-- -- local act = wezterm.action
-- local config = {}
-- -- local keys = {}
-- -- local mouse_bindings = {}
-- -- local launch_menu = {}
-- ---local haswork, work = pcall(require, "work")

-- --- Setup PowerShell options
-- -- if wezterm.target_triple == "x86_64-pc-windows-msvc" then
-- -- 	--- Grab the ver info for later use.
-- -- 	local success, stdout, stderr = wezterm.run_child_process({ "cmd.exe", "ver" })
-- -- 	local major, minor, build, rev = stdout:match("Version ([0-9]+)%.([0-9]+)%.([0-9]+)%.([0-9]+)")
-- -- 	local is_windows_11 = tonumber(build) >= 22000

-- -- 	--- Make it look cool.
-- -- 	if is_windows_11 then
-- -- 		wezterm.log_info("We're running Windows 11!")
-- -- 	end

-- -- 	--- Set Pwsh as the default on Windows
-- -- 	config.default_prog = { "pwsh.exe", "-NoLogo" }
-- -- 	table.insert(launch_menu, {
-- -- 		label = "Pwsh",
-- -- 		args = { "pwsh.exe", "-NoLogo" },
-- -- 	})
-- -- 	table.insert(launch_menu, {
-- -- 		label = "PowerShell",
-- -- 		args = { "powershell.exe", "-NoLogo" },
-- -- 	})
-- -- 	table.insert(launch_menu, {
-- -- 		label = "Pwsh No Profile",
-- -- 		args = { "pwsh.exe", "-NoLogo", "-NoProfile" },
-- -- 	})
-- -- 	table.insert(launch_menu, {
-- -- 		label = "PowerShell No Profile",
-- -- 		args = { "powershell.exe", "-NoLogo", "-NoProfile" },
-- -- 	})
-- -- else
-- -- 	--- Non-Windows Machine
-- -- 	table.insert(launch_menu, {
-- -- 		label = "Pwsh",
-- -- 		args = { "/usr/local/bin/pwsh", "-NoLogo" },
-- -- 	})
-- -- 	table.insert(launch_menu, {
-- -- 		label = "Pwsh No Profile",
-- -- 		args = { "/usr/local/bin/pwsh", "-NoLogo", "-NoProfile" },
-- -- 	})
-- -- end

-- -- --- Disable defaul keys and set some minimum ones for now.
-- -- --- This helps with conflicting keys in pwsh
-- -- keys = {
-- -- 	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
-- -- 	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
-- -- 	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
-- -- 	{ key = "!", mods = "CTRL", action = act.ActivateTab(0) },
-- -- 	{ key = "!", mods = "SHIFT|CTRL", action = act.ActivateTab(0) },
-- -- 	{ key = '"', mods = "ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
-- -- 	{ key = '"', mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
-- -- 	{ key = "#", mods = "CTRL", action = act.ActivateTab(2) },
-- -- 	{ key = "#", mods = "SHIFT|CTRL", action = act.ActivateTab(2) },
-- -- 	{ key = "$", mods = "CTRL", action = act.ActivateTab(3) },
-- -- 	{ key = "$", mods = "SHIFT|CTRL", action = act.ActivateTab(3) },
-- -- 	{ key = "%", mods = "CTRL", action = act.ActivateTab(4) },
-- -- 	{ key = "%", mods = "SHIFT|CTRL", action = act.ActivateTab(4) },
-- -- 	{ key = "%", mods = "ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
-- -- 	{ key = "%", mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
-- -- 	{ key = "&", mods = "CTRL", action = act.ActivateTab(6) },
-- -- 	{ key = "&", mods = "SHIFT|CTRL", action = act.ActivateTab(6) },
-- -- 	{ key = "'", mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
-- -- 	{ key = "(", mods = "CTRL", action = act.ActivateTab(-1) },
-- -- 	{ key = "(", mods = "SHIFT|CTRL", action = act.ActivateTab(-1) },
-- -- 	{ key = ")", mods = "CTRL", action = act.ResetFontSize },
-- -- 	{ key = ")", mods = "SHIFT|CTRL", action = act.ResetFontSize },
-- -- 	{ key = "*", mods = "CTRL", action = act.ActivateTab(7) },
-- -- 	{ key = "*", mods = "SHIFT|CTRL", action = act.ActivateTab(7) },
-- -- 	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
-- -- 	{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
-- -- 	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
-- -- 	{ key = "-", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
-- -- 	{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
-- -- 	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
-- -- 	{ key = "0", mods = "SHIFT|CTRL", action = act.ResetFontSize },
-- -- 	{ key = "0", mods = "SUPER", action = act.ResetFontSize },
-- -- 	-- I use Ctrl + Number in all my other apps.
-- -- 	-- I also never have more the 5 tabs
-- -- 	{ key = "1", mods = "CTRL", action = act.ActivateTab(0) },
-- -- 	{ key = "2", mods = "CTRL", action = act.ActivateTab(1) },
-- -- 	{ key = "3", mods = "CTRL", action = act.ActivateTab(2) },
-- -- 	{ key = "4", mods = "CTRL", action = act.ActivateTab(3) },
-- -- 	{ key = "5", mods = "CTRL", action = act.ActivateTab(4) },
-- -- 	-- { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
-- -- 	-- { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
-- -- 	-- { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
-- -- 	-- { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
-- -- 	-- { key = '3', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
-- -- 	-- { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
-- -- 	-- { key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
-- -- 	-- { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
-- -- 	-- { key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
-- -- 	-- { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal-- { domain =  'CurrentPaneDomain' } },
-- -- 	-- { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
-- -- 	-- { key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
-- -- 	-- { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
-- -- 	-- { key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
-- -- 	-- { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
-- -- 	-- { key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
-- -- 	-- { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
-- -- 	-- { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
-- -- 	-- { key = '9', mods = 'SUPER', action = act.ActivateTab(-1) },
-- -- 	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
-- -- 	{ key = "=", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
-- -- 	{ key = "=", mods = "SUPER", action = act.IncreaseFontSize },
-- -- 	{ key = "@", mods = "CTRL", action = act.ActivateTab(1) },
-- -- 	{ key = "@", mods = "SHIFT|CTRL", action = act.ActivateTab(1) },
-- -- 	{ key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
-- -- 	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
-- -- 	{ key = "F", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
-- -- 	{ key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
-- -- 	{ key = "K", mods = "CTRL", action = act.ClearScrollback("ScrollbackOnly") },
-- -- 	{ key = "K", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },
-- -- 	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
-- -- 	{ key = "L", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
-- -- 	{ key = "M", mods = "CTRL", action = act.Hide },
-- -- 	{ key = "M", mods = "SHIFT|CTRL", action = act.Hide },
-- -- 	{ key = "N", mods = "CTRL", action = act.SpawnWindow },
-- -- 	{ key = "P", mods = "CTRL", action = act.ActivateCommandPalette },
-- -- 	{ key = "R", mods = "CTRL", action = act.ReloadConfiguration },
-- -- 	{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
-- -- 	{ key = "T", mods = "CTRL", action = act.ShowLauncher },
-- -- 	{ key = "T", mods = "SHIFT|CTRL", action = act.ShowLauncher },
-- -- 	{
-- -- 		key = "U",
-- -- 		mods = "CTRL",
-- -- 		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
-- -- 	},
-- -- 	{
-- -- 		key = "U",
-- -- 		mods = "SHIFT|CTRL",
-- -- 		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
-- -- 	},
-- -- 	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
-- -- 	{ key = "W", mods = "CTRL", action = act.CloseCurrentTab({ confirm = true }) },
-- -- 	{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
-- -- 	{ key = "X", mods = "CTRL", action = act.ActivateCopyMode },
-- -- 	{ key = "X", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
-- -- 	{ key = "Z", mods = "CTRL", action = act.TogglePaneZoomState },
-- -- 	{ key = "Z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
-- -- 	{ key = "[", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
-- -- 	{ key = "]", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
-- -- 	{ key = "^", mods = "CTRL", action = act.ActivateTab(5) },
-- -- 	{ key = "^", mods = "SHIFT|CTRL", action = act.ActivateTab(5) },
-- -- 	{ key = "_", mods = "CTRL", action = act.DecreaseFontSize },
-- -- 	{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
-- -- 	{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
-- -- 	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
-- -- 	{ key = "f", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
-- -- 	{ key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
-- -- 	{ key = "k", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },
-- -- 	{ key = "k", mods = "SUPER", action = act.ClearScrollback("ScrollbackOnly") },
-- -- 	{ key = "l", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
-- -- 	{ key = "m", mods = "SHIFT|CTRL", action = act.Hide },
-- -- 	{ key = "m", mods = "SUPER", action = act.Hide },
-- -- 	{ key = "n", mods = "SUPER", action = act.SpawnWindow },
-- -- 	{ key = "r", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
-- -- 	{ key = "r", mods = "SUPER", action = act.ReloadConfiguration },
-- -- 	{ key = "t", mods = "SHIFT|CTRL", action = act.ShowLauncher },
-- -- 	{ key = "t", mods = "SUPER", action = act.ShowLauncher },
-- -- 	{
-- -- 		key = "u",
-- -- 		mods = "SHIFT|CTRL",
-- -- 		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
-- -- 	},
-- -- 	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
-- -- 	{ key = "w", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
-- -- 	{ key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },
-- -- 	{ key = "x", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
-- -- 	{ key = "z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
-- -- 	{ key = "{", mods = "SUPER", action = act.ActivateTabRelative(-1) },
-- -- 	{ key = "{", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
-- -- 	{ key = "}", mods = "SUPER", action = act.ActivateTabRelative(1) },
-- -- 	{ key = "}", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
-- -- 	{ key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },
-- -- 	{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
-- -- 	{ key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
-- -- 	{ key = "PageUp", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
-- -- 	{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
-- -- 	{ key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
-- -- 	{ key = "PageDown", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },
-- -- 	{ key = "LeftArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
-- -- 	-- Turning these off so I can use pwsh keys
-- -- 	-- { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
-- -- 	-- { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
-- -- 	-- Add these to allow quick moving between prompts
-- -- 	-- Use ctrl up/down to match vscode. Shift didn't feel natural
-- -- 	{ key = "UpArrow", mods = "CTRL", action = act.ScrollToPrompt(-1) },
-- -- 	{ key = "DownArrow", mods = "CTRL", action = act.ScrollToPrompt(1) },
-- -- 	--
-- -- 	{ key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
-- -- 	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
-- -- 	{ key = "UpArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
-- -- 	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
-- -- 	{ key = "DownArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
-- -- 	{ key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },
-- -- 	{ key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
-- -- 	{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
-- -- 	{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
-- -- 	{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
-- -- }

-- -- -- Mousing bindings
-- -- mouse_bindings = {
-- -- 	-- Change the default click behavior so that it only selects
-- -- 	-- text and doesn't open hyperlinks
-- -- 	{
-- -- 		event = { Up = { streak = 1, button = "Left" } },
-- -- 		mods = "NONE",
-- -- 		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
-- -- 	},

-- -- 	-- and make CTRL-Click open hyperlinks
-- -- 	{
-- -- 		event = { Up = { streak = 1, button = "Left" } },
-- -- 		mods = "CTRL",
-- -- 		action = act.OpenLinkAtMouseCursor,
-- -- 	},
-- -- 	{
-- -- 		event = { Down = { streak = 3, button = "Left" } },
-- -- 		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
-- -- 		mods = "NONE",
-- -- 	},
-- -- }

-- --- Default config settings
-- config.scrollback_lines = 7000
-- config.hyperlink_rules = wezterm.default_hyperlink_rules()
-- config.hide_tab_bar_if_only_one_tab = true
-- config.color_scheme = "flexoki-dark"
-- config.font = wezterm.font_with_fallback({
-- 	-- {
-- 	-- 	family = "FiraCode Nerd Font",
-- 	-- },
-- 	-- {
-- 	-- 	family = "FiraMono Nerd Font",
-- 	-- },
-- 	{
-- 		family = "Consolas",
-- 	},
-- 	{
-- 		family = "Lucida Console",
-- 	},
-- })
-- config.font_size = 9
-- ---config.launch_menu = launch_menu
-- config.default_cursor_style = "BlinkingBar"
-- config.disable_default_key_bindings = true
-- -- config.keys = keys
-- -- config.mouse_bindings = mouse_bindings

-- -- -- Allow overwriting for work stuff
-- -- if haswork then
-- -- 	work.apply_to_config(config)
-- -- end

-- return config

local wezterm = require 'wezterm'

local mux = wezterm.mux
local act = wezterm.action
local dimmer = { brightness = 0.1 }
wezterm.on('bell', function(window, pane)
  wezterm.log_info('the bell was rung in pane ' .. pane:pane_id() .. '!')
end)

wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
 end)
--GUI startup event to open a window with a tab bar
-- wezterm.on('gui-startup', function()
--     -- Specify default window dimensions
--     local window_width = 100
--     local window_height =100

--     -- Spawn the window with the specified dimensions and enable the tab bar
--     local tab, pane, window = mux.spawn_window({
--         dimensions = {
--             width = window_width,
--             height = window_height,
--         },
--         -- Enable the tab bar
        
--     })
-- end)

local config = {
  -- Default shell program
  default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo' },
  default_cwd= 'C:/Users/91827/Dropbox/PC/Desktop',
  -- default_prog = { 'cmd.exe' },

  -- Window decorations setting
  window_decorations = "TITLE | RESIZE",
  window_close_confirmation = "AlwaysPrompt",

  -- Font settings
  font = wezterm.font('Consolas'),
  font_size = 10,
  line_height = 1.2,
  text_blink_rate = 500,

  -- Color scheme
  color_scheme = 'flexoki-dark',
  cursor_blink_ease_in = "Linear",
  cursor_blink_rate = 800,
  visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 150,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 150,
  },

  colors = {
    foreground = 'silver',
    background = 'black',
    cursor_bg = '#52ad70',
    cursor_fg = 'black',
    cursor_border = '#52ad70',
    selection_fg = 'black',
    selection_bg = '#fffacd',
    scrollbar_thumb = '#222222',
    split = '#52c420',
    ansi = {
      'black', 'maroon', 'green', 'olive', 'navy', 'purple', 'teal', 'silver',
    },
    brights = {
      'grey', 'red', 'lime', 'yellow', 'blue', 'fuchsia', 'aqua', 'white',
    },
    indexed = { [136] = '#af8700' },
    compose_cursor = 'orange',
    copy_mode_active_highlight_bg = { Color = '#000000' },
    copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },
    quick_select_label_bg = { Color = 'peru' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { AnsiColor = 'Navy' },
    quick_select_match_fg = { Color = '#ffffff' },
    visual_bell = '#202020'
  },

  -- Inactive pane saturation and brightness
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7
  },

  -- Window frame font settings
  window_frame = {
    font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
  },

  -- Other example configurations
  window_background_opacity = 0.8,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  initial_cols = 120,
  initial_rows = 30,

  -- Key bindings
  keys = {
    {key = "d", mods = "CTRL|SHIFT", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } }},
    {key = "d", mods = "CTRL|ALT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } }},
    {key = "w", mods = "CTRL|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } }},
    {key = "q", mods = "CTRL|SHIFT", action = wezterm.action { CloseCurrentPane = { confirm = true } }},
    {key = "Tab", mods = "CTRL", action = wezterm.action { ActivateTabRelative = 1 }},
    {key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action { ActivateTabRelative = -1 }},
    {
      key = 'n',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.ToggleFullScreen,
    },
  },

  -- Scrollback lines
  scrollback_lines = 3000,
  enable_scroll_bar = true,
  default_cursor_style = 'BlinkingBar',

  -- Mouse bindings
  mouse_bindings = {
    { event = { Down = { streak = 1, button = "Right" }}, mods = "NONE", action = wezterm.action { PasteFrom = "Clipboard" }},
    { event = { Down = { streak = 1, button = "Middle" }}, mods = "NONE", action = wezterm.action { PasteFrom = "PrimarySelection" }},
  },

  -- Background configuration
  background = {
    {
      source = { File = 'C:/Users/91827/Dropbox/PC/Desktop/Alien_Ship_bg_vert_images/Backgrounds/spaceship_bg_1.png' },
      repeat_x = 'Mirror',
      hsb = { brightness = 0.1 },
      attachment = { Parallax = 0.1 },
    },
    {
      source = { File = 'C:/Users/91827/Dropbox/PC/Desktop/Alien_Ship_bg_vert_images/Overlays/overlay_1_spines.png' },
      width = '100%',
      repeat_x = 'NoRepeat',
      vertical_align = 'Bottom',
      repeat_y_size = '200%',
      hsb = { brightness = 0.1 },
      attachment = { Parallax = 0.2 },
    },
    {
      source = { File = 'C:/Users/91827/Dropbox/PC/Desktop/Alien_Ship_bg_vert_images/Overlays/overlay_2_alienball.png' },
      width = '100%',
      repeat_x = 'NoRepeat',
      vertical_offset = '10%',
      repeat_y_size = '200%',
      hsb = { brightness = 0.1 },
      attachment = { Parallax = 0.3 },
    },
    {
      source = { File = 'C:/Users/91827/Dropbox/PC/Desktop/Alien_Ship_bg_vert_images/Overlays/overlay_3_lobster.png' },
      width = '100%',
      repeat_x = 'NoRepeat',
      vertical_offset = '30%',
      repeat_y_size = '200%',
      hsb = { brightness = 0.1 },
      attachment = { Parallax = 0.4 },
    },
    {
      source = { File = 'C:/Users/91827/Dropbox/PC/Desktop/Alien_Ship_bg_vert_images/Overlays/overlay_4_spiderlegs.png' },
      width = '100%',
      repeat_x = 'NoRepeat',
      vertical_offset = '50%',
      repeat_y_size = '150%',
      hsb = { brightness = 0.1 },
      attachment = { Parallax = 0.5 },
    },
  }
}

-- Return the configuration to wezterm
return config
