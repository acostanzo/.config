export EDITOR="nvim"
export GPG_TTY=$(tty)
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export XDG_CONFIG_HOME="$HOME/.config"
export PIP_REQUIRE_VIRTUALENV=true

export PATH="$HOME/.local/bin:$PATH"

# Homebrew
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Fall back to xterm-256color if the current TERM isn't in the system terminfo database
# Use /usr/bin/infocmp to avoid Linuxbrew's ncurses (which bundles xterm-ghostty
# but isn't used by the system's terminal layer)
if ! /usr/bin/infocmp "$TERM" &>/dev/null 2>&1; then
  export TERM=xterm-256color
fi

# Secrets — machine-local file, not committed
[[ -f "$ZDOTDIR/.zshenv.local" ]] && source "$ZDOTDIR/.zshenv.local"
