return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_ls = {
        cmd = { "/Users/acostanzo/.local/share/mise/installs/ruby/3.4.2/bin/ruby", "-S", "ruby-lsp" },
      },
    },
  },
}
