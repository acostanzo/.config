return {
  -- Completely override the LazyVim Scala extra to remove telescope dependency and use blink.cmp
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    ft = { "scala", "sbt", "sc" },
    opts = function()
      local metals_config = require("metals").bare_config()

      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        serverVersion = "latest.snapshot",
      }

      metals_config.init_options.statusBarProvider = "off"

      -- Use blink.cmp capabilities instead of nvim-cmp
      metals_config.capabilities = require("blink.cmp").get_lsp_capabilities()

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
    keys = {
      {
        "<leader>mc",
        function()
          require("metals").compile_cascade()
        end,
        desc = "Metals Compile Cascade",
        ft = { "scala", "sbt" },
      },
      {
        "<leader>mh",
        function()
          require("metals.hover").hover_worksheet()
        end,
        desc = "Metals Hover Worksheet",
        ft = { "scala", "sbt" },
      },
      {
        "<leader>me",
        function()
          local metals_commands = {
            "build-import",
            "build-connect",
            "build-restart",
            "doctor-run",
            "compile-cascade",
            "sources-scan",
            "generate-bsp-config",
            "reset-choice",
            "analyze-stacktrace",
            "new-scala-project",
          }

          require("fzf-lua").fzf_exec(metals_commands, {
            prompt = "Metals Commands ❯ ",
            winopts = {
              height = 0.4,
              width = 0.6,
            },
            actions = {
              ["default"] = function(selected)
                if selected and selected[1] then
                  vim.lsp.buf.execute_command({ command = selected[1] })
                end
              end,
            },
          })
        end,
        desc = "Metals Commands",
        ft = { "scala", "sbt", "sc" },
      },
    },
  },
}
