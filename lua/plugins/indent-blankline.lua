return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local indent = require("ibl")

		indent.setup()
	end,
}
