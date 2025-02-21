return {
  "saghen/blink.cmp",
  dependencies = {
    { "saghen/blink.compat", lazy = true },
  },
  opts = {
    sources = {
      -- LazyVim as custom option copmpat to pass in external sources with blink.compat
      compat = { "obsidian", "obsidian_new", "obsidian_tags" },
    },
  },
}
