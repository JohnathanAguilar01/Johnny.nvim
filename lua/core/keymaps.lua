vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "Exit Neovim" })
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Save File" })
vim.keymap.set("n", "<leader>9", "<cmd>%s/\r//<cr>", { desc = "Deletes the ^M at the end" })
