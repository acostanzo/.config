-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>ya", function()
  local path = vim.fn.expand("%:.")
  local result = "@" .. path
  vim.fn.setreg("+", result)
end, { desc = "Yank file path for Claude Code" })
vim.keymap.set("v", "<leader>ya", function()
  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")
  local start_line = math.min(start_pos[2], end_pos[2])
  local end_line = math.max(start_pos[2], end_pos[2])
  local path = vim.fn.expand("%:.")
  local line_suffix = start_line == end_line and "#" .. start_line or "#" .. start_line .. ":" .. end_line
  local result = "@" .. path .. line_suffix
  vim.fn.setreg("+", result)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end, { desc = "Yank file path with line range for Claude Code" })
