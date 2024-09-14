return {
    "folke/tokyonight.nvim",
    priority = 9000,
    config = function()
      require("tokyonight").setup({
        style = "night",
      })

      vim.cmd("colorscheme tokyonight")
    end
}
