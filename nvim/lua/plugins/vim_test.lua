return {
  {
    "vim-test/vim-test",
    init = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#javascript#jest#executable"] = "yarn test"
    end,
    keys = {
      { "<leader>tt", "<cmd>TestFile<cr>", desc = "Run file tests" },
      { "<leader>tl", "<cmd>TestFile<cr>", desc = "Run last test" },
      { "<leader>tr", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
    },
  },
}
