return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",

	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup()

		-- set keymaps
		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating Terminal" })
		vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal Terminal" })
	end,
}
