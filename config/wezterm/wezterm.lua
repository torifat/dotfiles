local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font settings --
config.font = wezterm.font("Monaspace Argon")
-- config.freetype_load_target = "Light"
-- config.freetype_render_target = "HorizontalLcd"
config.font_size = 14.0
config.line_height = 1.3
config.harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" }
config.font_rules = {
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font("Monaspace Radon", {
			weight = "Regular",
		}),
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			-- family = "Monaspace Argon",
			family = "Monaspace Krypton",
			weight = "Bold",
			-- weight = "ExtraBold",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("Monaspace Radon", {
			weight = "ExtraBold",
		}),
	},
}

-- Color scheme settings --
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Macchiato"]
custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"

config.color_schemes = { ["OLEDppucino"] = custom }
config.color_scheme = "OLEDppucino"

-- Misc settings --
config.hide_tab_bar_if_only_one_tab = true
config.warn_about_missing_glyphs = true

return config
