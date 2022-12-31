local blinding_red = "#FF0000"

-- borrowed from iceberg
local barely_visible = "#1e2132"
local grey1 = "#6b7089"
local pink1 = "#e27878"
local pink2 = "#e98989"
local lime1 = "#b4be82"
local lime2 = "#c0ca8e"
local yellow1 = "#e2a478"
local orange1 = "#e9b189"
local teal1 = "#89b8c2"
local teal2 = "#95c4ce"
local blue1 = "#84a0c6"
local blue2 = "#91acd1"
local purple1 = "#a093c7"
local white1 = "#c6c8d1"
local white2 = "#d2d4de"

require("tokyonight").setup({
	-- use the night style
	style = "storm",
	transparent = true,
	dim_inactive = true,
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_colors = function(colors)
		colors.error = blinding_red
		colors.green = teal1 -- strings
		colors.green1 = orange1 -- variables
		colors.purple = blue1 -- keywords
		colors.magenta = pink2 -- conditionals
		colors.orange = yellow1 -- booleans
	end,
})

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
