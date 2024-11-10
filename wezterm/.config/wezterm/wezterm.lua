local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

config.font = wezterm.font("GeistMono Nerd Font")
-- config.font = wezterm.font("Terminess Nerd Font", { weight = "DemiBold" })
config.font_size = 16.5
config.line_height = 1.3
config.hide_tab_bar_if_only_one_tab = true

-- config.color_scheme = "Kanagawa Dragon (Gogh)"
config.color_scheme = "Gruvbox Material (Gogh)"
-- config.colors = require("base16")

config.window_background_opacity = 0.925
config.enable_tab_bar = false
config.macos_window_background_blur = 8
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 8,
	right = 8,
	top = 2,
	bottom = 0,
}

return config
