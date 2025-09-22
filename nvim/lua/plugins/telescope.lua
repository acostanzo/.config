return {
  -- Minimal telescope setup for metals only
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true, -- Only load when needed by metals
    opts = {
      defaults = {
        -- Minimal config just for metals
        prompt_prefix = "🔍 ",
        selection_caret = "❯ ",
        path_display = { "truncate" },
      },
    },
  },
}
