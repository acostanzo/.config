return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local filetype = {
      "filetype",
      icon_only = true,
      cond = function()
        return vim.bo.buftype == ""
      end,
    }

    local filename = {
      "filename",
      symbols = {
        modified = "⦿ ",
        readonly = "󰛐 ",
        unnamed = "",
        newfile = "🆕 ",
      },
      cond = function()
        return vim.bo.buftype == ""
      end,
    }

    local diff = {
      "diff",
      symbols = {
        added = " ",
        modified = " ",
        removed = " ",
      },
    }

    local shared_winbar = {
      lualine_c = {
        filetype,
        filename,
        diff,
      },
      lualine_x = {
        {
          "diagnostics",
        },
      },
    }

    opts.winbar = shared_winbar
    opts.inactive_winbar = shared_winbar

    -- Rounded separators to match tmux pill style
    opts.options = opts.options or {}
    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "", right = "" }

    -- Rounded outer caps: prepend a left cap to section_a, append a right cap to section_z
    opts.sections = opts.sections or {}

    -- Left outer cap: insert at start of lualine_a
    local left_cap = {
      function()
        return ""
      end,
      padding = 0,
      separator = { left = "", right = "" },
      color = function()
        local mode_colors = {
          n = "lualine_a_normal",
          i = "lualine_a_insert",
          v = "lualine_a_visual",
          V = "lualine_a_visual",
          ["\x16"] = "lualine_a_visual",
          c = "lualine_a_command",
          R = "lualine_a_replace",
          t = "lualine_a_terminal",
        }
        local hl_name = mode_colors[vim.fn.mode()] or "lualine_a_normal"
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = hl_name, link = false })
        if ok and hl and hl.bg then
          return { fg = string.format("#%06x", hl.bg), bg = "NONE" }
        end
        return { fg = "#8caaee", bg = "NONE" }
      end,
    }

    -- Right outer cap: append to lualine_z
    local right_cap = {
      function()
        return ""
      end,
      padding = 0,
      separator = { left = "", right = "" },
      color = function()
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "lualine_a_normal", link = false })
        if ok and hl and hl.bg then
          return { fg = string.format("#%06x", hl.bg), bg = "NONE" }
        end
        return { fg = "#8caaee", bg = "NONE" }
      end,
    }

    -- Prepend left cap to lualine_a
    opts.sections.lualine_a = opts.sections.lualine_a or { "mode" }
    table.insert(opts.sections.lualine_a, 1, left_cap)

    -- Redistribute right side: x=transient activity, y=repo state, z=cursor position
    -- Pull git diff and lazy updates out of x into y
    local lazy_updates = nil
    local git_diff = nil
    if opts.sections.lualine_x then
      local new_x = {}
      for _, comp in ipairs(opts.sections.lualine_x) do
        if type(comp) == "table" and comp[1] == "diff" then
          git_diff = comp
        elseif type(comp) == "table" and comp.cond == require("lazy.status").has_updates then
          lazy_updates = comp
        else
          table.insert(new_x, comp)
        end
      end
      opts.sections.lualine_x = new_x
    end

    -- y = repo state (lazy updates + git diff)
    opts.sections.lualine_y = {}
    if lazy_updates then
      table.insert(opts.sections.lualine_y, lazy_updates)
    end
    if git_diff then
      table.insert(opts.sections.lualine_y, git_diff)
    end

    -- z = cursor position (progress + location) + right cap
    opts.sections.lualine_z = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
      right_cap,
    }

    return opts
  end,
}
