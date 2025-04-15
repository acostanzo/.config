return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_ls = {
        cmd = function()
          -- Try to detect Ruby version from the project
          local project_root = vim.fn.getcwd()
          local ruby_version = nil

          -- Check for .tool-versions file (mise/asdf)
          local tool_versions_file = io.open(project_root .. "/.tool-versions", "r")
          if tool_versions_file then
            for line in tool_versions_file:lines() do
              local version_match = line:match("^ruby%s+([%d%.]+)")
              if version_match then
                ruby_version = version_match
                break
              end
            end
            tool_versions_file:close()
          end

          -- If no version in .tool-versions, check for .ruby-version file
          if not ruby_version then
            local ruby_version_file = io.open(project_root .. "/.ruby-version", "r")
            if ruby_version_file then
              ruby_version = ruby_version_file:read("*line"):gsub("%s+", "")
              ruby_version_file:close()
            end
          end

          -- If still no version, try to extract from Gemfile
          if not ruby_version then
            local gemfile = io.open(project_root .. "/Gemfile", "r")
            if gemfile then
              for line in gemfile:lines() do
                local version_match = line:match("ruby%s+['\"]([%d%.]+)['\"]")
                if version_match then
                  ruby_version = version_match
                  break
                end
              end
              gemfile:close()
            end
          end

          -- Construct the path to the correct Ruby version using mise
          local ruby_path
          if ruby_version then
            -- Try to get the mise Ruby path for this specific version
            ruby_path = vim.fn.system("mise which ruby --version=" .. ruby_version .. " 2>/dev/null"):gsub("\n", "")
          end

          -- If we couldn't find a specific version, fall back to the project's current Ruby
          if not ruby_path or ruby_path == "" then
            ruby_path = vim.fn
              .system("cd " .. vim.fn.shellescape(project_root) .. " && mise which ruby 2>/dev/null")
              :gsub("\n", "")
          end

          -- Final fallback to system Ruby if all else fails
          if not ruby_path or ruby_path == "" then
            ruby_path = vim.fn.system("which ruby"):gsub("\n", "")
          end

          return { ruby_path, "-S", "ruby-lsp" }
        end,
      },
    },
  },
}
