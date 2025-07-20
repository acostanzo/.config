# Config
This repo contains the shareable portions of my mac configs. I uses this to maintain a similar development environment on multiple machines. You can use it if you see something you like when we pair.

## Setup
For the whole shebang, clone this repo to `~/.config`. (Be sure to backup any existing files and configurations you may already have in your `~/.config` folder)

### Homebrew
[Homebrew](https://brew.sh/) is a package manager for mac

1. Install [Homebrew](https://brew.sh/)
1. Install brew dependencies `brew bundle --file=~/.config/brew/Brewfile`

### Fish Shell
Set [fish](https://fishshell.com/docs/current/#default-shell) as your shell, and restart your machine.

### Fisher
[Fisher](https://github.com/jorgebucaran/fisher) is a plugin manager for [fish shell](https://fishshell.com/)

1. Install [Fisher](https://github.com/jorgebucaran/fisher?tab=readme-ov-file#installation)
1. Install fisher dependencies `fisher update`

### TPM
[TPM](https://github.com/tmux-plugins/tpm) is a package manager for tmux. 

1. Install tpm `git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"`
1. Start a tmux session with `tmux`, if you haven't already
1. Open `.config/tmux/tmux.conf`
1. Install packages with `prefix + I`
1. Reload tmux config with `prefix + R`
