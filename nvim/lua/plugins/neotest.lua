return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "olimorris/neotest-rspec",
  },
  opts = {
    adapters = {
      ["neotest-rspec"] = {
        rspec_cmd = function()
          vim.iter({ "bundle", "exec", "rspec" }):flatten():totable()
        end,
      },
    },
  },
}
