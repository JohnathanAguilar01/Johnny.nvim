return {
	"folke/tokyonight.nvim",
	priority = 9000,
	opts = {
		on_highlights = function(hl, c)
			hl.SpellBad = { fg = c.red, undercurl = true }
			hl.SpellCap = { fg = c.red, undercurl = true }
			hl.SpellLocal = { fg = c.red, undercurl = true }
			hl.SpellRare = { fg = c.red, undercurl = true }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(vim.tbl_deep_extend("force", {
			-- style = "night",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		}, opts))

		vim.cmd("colorscheme tokyonight")
	end,
}
