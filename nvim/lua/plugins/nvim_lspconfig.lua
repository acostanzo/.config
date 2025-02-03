return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        cmd = { "/Users/acostanzo/.asdf/shims/ruby", "-S", "ruby-lsp" },
      },
    },
  },
}
