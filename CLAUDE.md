# CLAUDE.md

## What This Is

A macOS dotfiles repository cloned to `~/.config`. All configs are managed here and committed directly from this directory.

## Design System

Every tool shares a unified aesthetic — changes to one config should maintain consistency with the others:

- **Theme**: Catppuccin Frappe everywhere (tmux, neovim, ghostty, sketchybar, starship, bat)
- **Font**: JetBrains Mono Nerd Font (installed via Brewfile)
- **UI Style**: Rounded powerline separators (U+E0B4 ``, U+E0B6 ``), pill-shaped elements, capsule corners
- **Navigation**: Vim keybindings across fish, tmux, aerospace, and neovim
- **Colors reference**: Frappe base=#303446, mantle=#292c3c, surface_0=#414559, surface_1=#51576d, yellow=#e5c890, blue=#8caaee

## Git Configuration

The `.gitignore` uses an **allowlist pattern**: everything is ignored by default (`*`), then specific directories and files are explicitly unignored with `!`. When adding a new tool config, you must add `!toolname/` and `!toolname/**/*` to `.gitignore` or it won't be tracked. Some directories are partially tracked (e.g., fish only includes specific function files, tmux only includes tmux.conf).

## Key Integrations

- **AeroSpace ↔ SketchyBar**: `exec-on-workspace-change` in aerospace.toml triggers sketchybar events. Workspace indicators in sketchybar use `aerospace list-workspaces` commands.
- **Tmux ↔ Neovim**: vim-tmux-navigator enables seamless pane/split navigation with ctrl+hjkl.
- **Tmux catppuccin plugin**: Uses a custom fork at `acostanzo/tmux-catppuccin`. Spelling is `flavor` not `flavour`. Background `"#303446"` (hardcoded base) gives visual transparency while keeping powerline separators working (unlike `"none"` which breaks reverse-video rendering).

## Known Gotchas

- **Unicode powerline characters**: The Write/Edit tools strip powerline glyphs (U+E0B4, U+E0B6, U+E0B5, U+E0B7). Use `python3` to write files containing these characters.
- **macOS Sequoia WiFi**: CLI tools return `<redacted>` for SSID. Network plugin checks IP presence instead.
- **SketchyBar `space` component**: Doesn't work with AeroSpace (tied to Mission Control). Use regular `item` components with custom event subscriptions.
- **Tmux `%if` conditionals**: Evaluated at server start only. Changes to `window_status_style` or separator styles require `tmux kill-server`.
- **SketchyBar text centering**: `icon.align=center` requires a fixed `width` on the item to take effect.

## Common Operations

```bash
# Install all packages
brew bundle --file=~/.config/brew/Brewfile

# Reload sketchybar
brew services restart sketchybar

# Reload tmux config (from within tmux)
prefix + R

# Full tmux reset (needed for separator/style changes)
tmux kill-server

# Neovim plugin management
# LazyVim handles this automatically on startup
```

## Repository Structure

Configs are organized by tool name at the top level. Key relationships:
- `brew/Brewfile` — single source of truth for all installed packages and fonts
- `sketchybar/colors.sh` — shared color definitions for all sketchybar scripts
- `sketchybar/plugins/` — event handler scripts (must be `chmod +x`)
- `nvim/lua/plugins/` — LazyVim plugin overrides (opts function pattern)
- `mise/config.toml` — runtime versions (Java, Node, Python, Ruby)
