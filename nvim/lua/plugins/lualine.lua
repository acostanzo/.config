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
        added = " ",
        modified = " ",
        removed = " ",
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

    return opts
  end,
}
