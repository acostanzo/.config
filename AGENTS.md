# AGENTS.md

## Purpose

This repository is a live dotfiles repo cloned directly to `~/.config`.
Changes here affect the active development environment, so agents should treat
the repo as both source control and runtime configuration.

Use this file as the operating guide for organizing existing configs, adding new
tool configs, and making maintenance updates through Codex or other agents.

## Repository Model

- The Git remote is `git@github.com:acostanzo/.config.git`.
- The main branch is `main`.
- Configs are edited in place under `~/.config`; there is no stow/symlink layer.
- Top-level directories are organized by tool name.
- `bin/setup` is the bootstrap script for a new machine and is intended to be
  idempotent.
- `.gitignore` is an allowlist: everything is ignored by default, then selected
  files and directories are explicitly unignored.

When adding a new tracked config, update `.gitignore` with both:

```gitignore
!toolname/
!toolname/**/*
```

For a single root file, add an explicit `!filename`.

## Safety Rules

- Do not commit machine-local secrets, shell history, caches, generated plugin
  installs, or app credential files.
- Keep machine-specific shell values in `zsh/.zshenv.local` or
  `zsh/.zshrc.local`; those are intentionally ignored.
- Preserve the allowlist ignore pattern. Do not replace it with a broad
  denylist.
- Before editing, check `git status --short --branch` and avoid reverting
  unrelated local changes.
- Prefer small, focused commits that describe the tool or behavior changed.
- If a command needs network access or system changes, ask for approval before
  running it.

## Active Tooling

### Package and Runtime Management

- `brew/Brewfile` is the source of truth for system packages, macOS apps, and
  fonts installed by Homebrew.
- `mise/config.toml` manages language runtimes and user CLI tools.
- `bin/setup` runs Homebrew bundle, installs mise tools, bootstraps zsh, installs
  Zinit, and installs tmux TPM.

### Shell

- `zsh/.zshenv` sets `EDITOR`, `XDG_CONFIG_HOME`, `STARSHIP_CONFIG`, Homebrew
  shellenv, mise shims, pip virtualenv policy, and terminfo fallback.
- `zsh/.zshrc` loads Zinit plugins, vi mode, history, completion, aliases, fzf,
  mise, starship, and zoxide.
- `~/.zshenv` should only bootstrap into this repo:

```zsh
export ZDOTDIR="$HOME/.config/zsh"
source "$ZDOTDIR/.zshenv"
```

### Prompt and Terminal

- `starship/starship.toml` defines the Catppuccin Frappe prompt with powerline
  separators and runtime/git/time modules.
- `ghostty/config` sets Ghostty font, theme, padding, titlebar behavior, and key
  bindings.
- `bat/config` selects the Catppuccin Frappe theme; theme files live in
  `bat/themes/`.

### Editor

- `nvim/init.lua` bootstraps `lua/config/lazy.lua`.
- `nvim/lua/config/` contains LazyVim setup, options, keymaps, and autocmds.
- `nvim/lua/plugins/` contains LazyVim plugin overrides and additions.
- `nvim/lazy-lock.json` is intentionally ignored.

### Tmux

- `tmux/tmux.conf` is the only tracked tmux file.
- TPM plugins are installed under `tmux/plugins/` and ignored.
- The config uses Catppuccin, vim-tmux-navigator, huckleberry, resurrect,
  continuum, sensible, yank, open, and copycat.
- Some tmux style changes require `tmux kill-server`, not just a reload.

### Window Manager and Menu Bar

- `aerospace/aerospace.toml` defines tiling behavior, gaps, workspaces, vim-style
  navigation, service mode, and SketchyBar event triggers.
- `sketchybar/sketchybarrc` builds the top bar.
- `sketchybar/colors.sh` is the shared Catppuccin Frappe palette.
- `sketchybar/items/` declares bar items.
- `sketchybar/plugins/` contains event handlers and must remain executable.
- AeroSpace workspace and mode changes trigger SketchyBar updates.

## Design System

Keep visual changes consistent across tools:

- Theme: Catppuccin Frappe.
- Font: `MonaspiceNe Nerd Font`.
- Style: rounded powerline separators, pill/capsule status elements, compact
  terminal-focused UI.
- Navigation: vim-style movement where possible.

Known font detail: Nerd Fonts registers Monaspace Neon as
`MonaspiceNe Nerd Font` on macOS. Using `Monaspace Neon Nerd Font` may silently
fall back to a different font.

## Common Commands

```bash
# Repo state
git status --short --branch

# Bootstrap or refresh installed dependencies
~/.config/bin/setup

# Install Homebrew packages only
brew bundle --file=~/.config/brew/Brewfile

# Install mise-managed tools
mise install

# Reload SketchyBar
brew services restart sketchybar

# Reload tmux config from inside tmux
# prefix + R

# Full tmux reset for style/separator changes
tmux kill-server
```

## Validation Checklist

For documentation-only changes:

- Review `git diff -- README.md AGENTS.md .gitignore`.

For shell changes:

- Start a new zsh shell or run `zsh -i -c exit`.
- Check that `mise`, `starship`, `fzf`, and `zoxide` initialize without errors.

For package/runtime changes:

- Run `brew bundle check --file=~/.config/brew/Brewfile` when Homebrew is
  available.
- Run `mise install` after changing `mise/config.toml`.

For tmux changes:

- Reload with `prefix + R`.
- Use `tmux kill-server` if status styling, separators, or plugin load order
  changed.

For SketchyBar or AeroSpace changes:

- Restart SketchyBar with `brew services restart sketchybar`.
- Verify workspace changes still update the bar.

For Neovim changes:

- Open `nvim` and let LazyVim report plugin/config errors.
- Run `:Lazy` for plugin state when needed.

## Agent Workflow

1. Inspect the current repo state.
2. Identify whether the target file is tracked or needs `.gitignore` allowlist
   updates.
3. Read the relevant tool config before editing.
4. Make the smallest coherent change.
5. Preserve executable bits for shell scripts in `sketchybar/`, `bin/`, and
   plugin helper paths.
6. Run the narrowest useful validation command.
7. Summarize changed files, validation performed, and any remaining manual
   reload steps.

## Documentation Map

- `README.md`: human overview and setup entry point.
- `AGENTS.md`: agent operating guide and maintenance rules.
- `CLAUDE.md`: Claude/Codex-oriented notes, gotchas, and design details.
