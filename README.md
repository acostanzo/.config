# Config

Dotfiles for my macOS development environment. Synced via Git to maintain a consistent setup across machines.

## What's Included

- **zsh** — Shell config with zinit, vi mode, autosuggestions, syntax highlighting
- **starship** — Cross-shell prompt with Catppuccin Frappe theme
- **tmux** — Terminal multiplexer with Catppuccin theme, vim-tmux-navigator, TPM
- **neovim** — Editor configuration
- **ghostty** — Terminal emulator
- **aerospace** — Tiling window manager
- **sketchybar** — Menu bar
- **mise** — Runtime version manager (node, python, ruby, java)
- **bat, eza, fzf, zoxide** — CLI utilities

## Setup

Clone to `~/.config` and run the setup script:

```bash
git clone git@github.com:acostanzo/.config.git ~/.config
~/.config/bin/setup
```

The script is idempotent — run it again anytime to check status or pick up changes.

After first-time setup:

1. Open a new terminal to load the zsh config
2. Start tmux and press `prefix + I` to install tmux plugins
3. Press `prefix + R` to reload the tmux config

## Machine-Local Config

Secrets and machine-specific settings go in `~/.config/zsh/.zshenv.local` (gitignored). Example:

```bash
export KAMAL_REGISTRY_PASSWORD="..."
```
