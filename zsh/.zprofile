# Homebrew may prepend its paths in login shells. Re-assert mise afterwards so
# user-space language and CLI defaults remain ahead of Homebrew and macOS.
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

typeset -U path PATH
path=("$HOME/.local/share/mise/shims" "$HOME/.local/bin" $path)

