return {
  {
    "GR3YH4TT3R93/zellij-nav.nvim",
    cond = os.getenv("ZELLIJ") == "0", -- Only load plugin if in active Zellij instance
    event = "VeryLazy", -- Lazy load plugin for improved startup times
    init = function() -- Only needed if you want to override default keymaps otherwise just call opts = {}
      vim.g.zellij_nav_default_mappings = false -- Default: true
    end,
    opts = {}, -- Optional
    keys = {
      { "<C-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true } },
      { "<C-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true } },
      { "<C-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true } },
      { "<C-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true } },
    },
  },
}
