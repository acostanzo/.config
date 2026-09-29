# Config

Dotfiles for my macOS development environment. This repo is cloned directly to
`~/.config`, edited in place, and synced through Git to keep machines aligned.

## Included Configs

- **zsh**: shell config with Zinit, vi mode, autosuggestions, syntax
  highlighting, completions, fzf, mise, starship, and zoxide.
- **starship**: Catppuccin Frappe prompt with powerline separators.
- **Herdr**: terminal workspaces with Ctrl+H/J/K/L navigation across panes and
  Neovim splits.
- **Neovim**: LazyVim-based editor configuration.
- **Ghostty**: terminal emulator theme, font, padding, and key bindings.
- **AeroSpace**: tiling window manager with vim-style navigation and workspace
  bindings.
- **mise**: runtime and CLI tool management for Node, Python, Ruby, Java, and
  common developer tools.
- **Codex CLI**: installed and updated with OpenAI's standalone installer.
- **bat**: Catppuccin Frappe syntax highlighting theme.
- **Homebrew**: package, cask, tap, and font installation through `brew/Brewfile`.

## Setup

Clone to `~/.config` and run the setup script:

```bash
git clone git@github.com:acostanzo/.config.git ~/.config
~/.config/bin/setup
```

The script is intended to be idempotent. Run it again to check setup state,
install newly added packages, refresh mise-managed tools, or update Codex CLI.

After first-time setup, open a new terminal to load the zsh config, then open
Neovim inside Herdr so Lazy installs its navigation companion.

## Herdr Navigation

`bin/setup` installs the Herdr side of
[Herdr Neovim Navigator](https://github.com/bojackduy/nvim-herdr-navigation).
Lazy installs the Neovim side from `nvim/lua/plugins/herdr_navigation.lua`.
Requires Herdr 0.7.0+ and Neovim 0.8+.

Hold Ctrl and use H/J/K/L to move left/down/up/right. In Neovim normal mode,
focus moves through editor splits first, then into the neighboring Herdr pane
at the edge. In a shell or agent pane, the same keys move between Herdr panes.
Outside Herdr, LazyVim's normal window navigation remains available.

For an existing installation, run:

```bash
herdr plugin install bojackduy/nvim-herdr-navigation/herdr-vim-navigator --yes
herdr server reload-config
```

Restart Neovim after changing its plugin configuration. Plugin installations and
Herdr runtime state remain ignored; only `herdr/config.toml` is tracked.

## Day-to-Day Use

```bash
# Edit the repo
cd ~/.config

# Check tracked state
git status --short --branch

# Install Homebrew packages
brew bundle --file=~/.config/brew/Brewfile

# Install mise tools
mise install

```

## Repository Conventions

The repo uses an allowlist `.gitignore`: everything is ignored by default, then
specific files and directories are explicitly unignored. When adding a new tool
config, update `.gitignore` or Git will ignore it.

Machine-specific settings belong in ignored local files:

- `~/.config/zsh/.zshenv.local`
- `~/.config/zsh/.zshrc.local`

Do not commit secrets, credentials, shell history, generated plugin installs, or
app runtime state.

## Agent Documentation

Use `AGENTS.md` as the operating guide for Codex or other agents working in this
repo. It documents the active tools, config layout, safety rules, validation
commands, and update workflow.

`CLAUDE.md` is a thin Claude Code adapter that imports `AGENTS.md` and keeps
Claude-specific notes.
