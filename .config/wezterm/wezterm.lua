local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Performance stuff
config.max_fps = 120
config.front_end = "WebGpu"

-- Color scheme
config.color_scheme = "catppuccin-mocha"

-- Font
config.font = wezterm.font_with_fallback({
	"LiterationMono Nerd Font",
	"Apple Color Emoji",
})
config.font_size = 16

-- Window configuration
config.macos_window_background_blur = 30
config.window_decorations = "INTEGRATED_BUTTONS"
config.native_macos_fullscreen_mode = true
config.window_frame = {
	font = wezterm.font({ family = "LiterationMono Nerd Font", weight = "Bold" }),
	font_size = 14,
}

local function tab_title(tab)
	local title = tab.tab_title
	if title and #title > 0 then
		return title
	end
	title = tab.active_pane.foreground_process_name
	local component = ""
	for word in title:gmatch("([^/]+)") do
		component = word
	end
	return component
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)

	local color_scheme = config.resolved_palette
	local active = color_scheme.ansi[7]
	local inactive = color_scheme.ansi[5]

	return {
		{ Background = { Color = not tab.is_active and inactive or active } },
		{ Foreground = { Color = "none" } },
		{ Text = "" .. tab.tab_index + 1 },
		{ Text = " " .. title .. " " },
	}
end)

wezterm.on("update-right-status", function(window, pane)
	-- Grab the utf8 character for the "powerline" left facing
	-- solid arrow.
	local cwd = pane:get_current_working_dir().file_path
	-- Remove home folder
	cwd = cwd:gsub(wezterm.home_dir, "~")
	-- Remove projects dir
	cwd = cwd:gsub("~/Documents/", "")

	local session = window:active_workspace()

	local color_scheme = window:effective_config().resolved_palette
	local thm_pink = color_scheme.ansi[6]
	local thm_green = color_scheme.ansi[3]
	local thm_fg = color_scheme.foreground

	window:set_right_status(wezterm.format({
		-- First, we draw the arrow...
		{ Background = { Color = "none" } },
		{ Foreground = { Color = thm_pink } },
		{ Text = "" },
		{ Background = { Color = thm_pink } },
		{ Foreground = { Color = "none" } },
		{ Text = " " },

		{ Background = { Color = "none" } },
		{ Foreground = { Color = thm_fg } },
		{ Text = " " .. cwd .. " " },

		{ Background = { Color = "none" } },
		{ Foreground = { Color = thm_green } },
		{ Text = "" },
		{ Background = { Color = thm_green } },
		{ Foreground = { Color = "none" } },
		{ Text = " " },

		{ Background = { Color = "none" } },
		{ Foreground = { Color = thm_fg } },
		{ Text = " " .. session .. " " },
	}))
end)

-- Project setup
local projects = {
	{
		label = "main",
		id = wezterm.home_dir,
		tabs = {},
	},
	{
		label = "config",
		id = wezterm.home_dir .. "/.config",
		tabs = {
			{ cwd = "", title = "misc", cmd = "nvim" },
		},
	},
	{
		label = "darc",
		id = wezterm.home_dir .. "/Documents/darc",
		tabs = {
			{ cwd = "", title = "editor", cmd = "nvim" },
			{ cwd = "api", title = "api", cmd = "poetry run api launch -drsl DEBUG" },
			{ cwd = "frontend/frontend", title = "frontend", cmd = "ng s" },
			{ cwd = "", title = "git", cmd = "lazygit" },
			{ cwd = "", title = "misc", cmd = "" },
		},
	},
	{
		label = "jdap",
		id = wezterm.home_dir .. "/Documents/jdap",
		tabs = {
			{ cwd = "", title = "editor", cmd = "nvim" },
			{ cwd = "", title = "git", cmd = "lazygit" },
			{ cwd = "", title = "misc", cmd = "" },
		},
	},
	{
		label = "galileo",
		id = wezterm.home_dir .. "/Documents/galileo",
		tabs = {
			{ cwd = "", title = "editor", cmd = "nvim" },
			{ cwd = "", title = "git", cmd = "lazygit" },
			{ cwd = "", title = "misc", cmd = "" },
		},
	},
}
local function choose_project()
	local choices = {}
	for index, project in ipairs(projects) do
		local filteredChoice = {}
		for k, v in pairs(project) do
			if k == "label" or k == "id" then
				filteredChoice[k] = v
			end
		end
		choices[index] = filteredChoice
	end

	-- The InputSelector action presents a modal UI for choosing between a set of options
	return wezterm.action.InputSelector({
		title = "Projects",
		-- The options we wish to choose from
		choices = choices,
		action = wezterm.action_callback(function(child_window, child_pane, id, label)
			if not id then
				return
			end

			child_window:perform_action(
				wezterm.action.SwitchToWorkspace({
					name = label,
					spawn = { cwd = id },
				}),
				child_pane
			)
		end),
	})
end
wezterm.on("gui-startup", function(_)
	local mux = wezterm.mux
	for _, project in ipairs(projects) do
		local base_dir = project.id
		local tab_info, pane, window = nil, nil, nil
		local first_tab = nil
		for _, tab in ipairs(project.tabs) do
			local tab_dir = base_dir .. "/" .. tab.cwd
			if not window then
				tab_info, pane, window = mux.spawn_window({
					workspace = project.label,
					cwd = tab_dir,
				})
				first_tab = tab_info
			else
				tab_info, pane, window = window:spawn_tab({
					cwd = tab_dir,
				})
			end
			pane:send_text(tab.cmd .. "\n")
			tab_info:set_title(tab.title)
		end
		if first_tab then
			first_tab:activate()
		end
	end
end)

-- Keymappings
local function move_pane(key, direction)
	return {
		key = key,
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection(direction),
	}
end
local function resize_pane(key, direction)
	return {
		key = key,
		mods = "LEADER",
		action = wezterm.action({ AdjustPaneSize = { direction, 5 } }),
	}
end
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Sends the / key, for vim
	{ key = "/", mods = "CTRL", action = wezterm.action({ SendString = "\x1f" }) },
	-- Sends ESC + b and ESC + f sequence, which is used
	-- for telling your shell to jump back/forward.
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\x1bb") },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	-- Tmux bindings
	{
		key = "b",
		-- When we're in leader mode _and_ CTRL + A is pressed...
		mods = "LEADER|CTRL",
		-- Actually send CTRL + A key to the terminal
		action = wezterm.action.SendKey({ key = "b", mods = "CTRL" }),
	},
	{
		key = ",",
		mods = "SUPER",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
			args = { "nvim", wezterm.config_file },
		}),
	},
	{
		key = '"',
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	move_pane("j", "Down"),
	move_pane("k", "Up"),
	move_pane("h", "Left"),
	move_pane("l", "Right"),
	resize_pane("J", "Down"),
	resize_pane("K", "Up"),
	resize_pane("H", "Left"),
	resize_pane("L", "Right"),
	{
		key = "s",
		mods = "LEADER",
		-- Present in to our project picker
		action = choose_project(),
	},
	{
		key = "f",
		mods = "LEADER",
		-- Present a list of existing workspaces
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
}

-- Environment setup
config.set_environment_variables = {
	PATH = "/usr/local/bin:" .. os.getenv("PATH"),
}

return config
