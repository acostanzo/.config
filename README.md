# Config

Dotfiles for my macOS development environment. This repo is cloned directly to
`~/.config`, edited in place, and synced through Git to keep machines aligned.

## Included Configs

- **zsh**: shell config with Zinit, vi mode, autosuggestions, syntax
  highlighting, completions, fzf, mise, starship, and zoxide.
- **starship**: Catppuccin Frappe prompt with powerline separators.
- **tmux**: terminal multiplexer with Catppuccin, vim-tmux-navigator, TPM,
  huckleberry, resurrect, continuum, and related plugins.
- **Neovim**: LazyVim-based editor configuration.
- **Ghostty**: terminal emulator theme, font, padding, and key bindings.
- **AeroSpace**: tiling window manager with vim-style navigation and workspace
  bindings.
- **SketchyBar**: menu bar with AeroSpace integration and system status items.
- **mise**: runtime and CLI tool management for Node, Python, Ruby, Java, and
  common developer tools.
- **bat**: Catppuccin Frappe syntax highlighting theme.
- **Homebrew**: package, cask, tap, and font installation through `brew/Brewfile`.

## Setup

Clone to `~/.config` and run the setup script:

```bash
git clone git@github.com:acostanzo/.config.git ~/.config
~/.config/bin/setup
```

The script is intended to be idempotent. Run it again to check setup state,
install newly added packages, or refresh mise-managed tools.

After first-time setup:

1. Open a new terminal to load the zsh config.
2. Start tmux and press `prefix + I` to install tmux plugins.
3. Press `prefix + R` to reload the tmux config.

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

# Restart SketchyBar
brew services restart sketchybar
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

`CLAUDE.md` contains additional Claude/Codex-oriented design notes and known
gotchas, including font naming, Catppuccin details, and SketchyBar/tmux caveats.
