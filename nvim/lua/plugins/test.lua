return {
  { "nvim-neotest/neotest-jest" },
  { "olimorris/neotest-rspec" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-jest",
        "neotest-rspec",
      },
    },
  },
}
