return {
  {
    "vim-test/vim-test",
    init = function()
      vim.g["test#custom_strategies"] = {
        tmux = function(cmd)
          local test_script_path = "/tmp/vim_test_runner.sh"

          local test_script = string.format(
            [[
              #!/bin/bash
              echo %s
              %s
              status=$?
              if [ "$status" -eq 0 ]; then
                echo "✅ Passed"
              else
                echo "❌ Failed"
              fi
                read -n 1 -s -r -p "Press any key to close..."
                tmux kill-pane
            ]],
            cmd,
            cmd
          )

          -- Write to /tmp
          -- Safely write to /tmp
          local file, err = io.open(test_script_path, "w")
          if not file then
            vim.notify("Failed to open file: " .. (err or "unknown error"), vim.log.levels.ERROR)
            return
          end

          local success, write_err = pcall(function()
            file:write(test_script)
          end)

          if not success then
            vim.notify("Failed to write test script: " .. (write_err or "unknown error"), vim.log.levels.ERROR)
            file:close()
            return
          end

          file:close()

          os.execute("chmod +x " .. test_script_path)

          -- Create new pane and capture its ID
          local pane_id =
            vim.fn.system("tmux split-window -v -P -F '#{pane_id}' 'bash " .. test_script_path .. "'"):gsub("%s+", "")

          -- Focus the new pane
          if pane_id and pane_id ~= "" then
            os.execute("tmux select-pane -t " .. pane_id)
          end
        end,
      }
      vim.g["test#strategy"] = "tmux"
    end,
    keys = {
      { "<leader>tt", "<cmd>TestFile<cr>", desc = "Run file tests" },
      { "<leader>tl", "<cmd>TestFile<cr>", desc = "Run last test" },
      { "<leader>tr", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
    },
  },
}
