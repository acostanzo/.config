set -g fish_key_bindings fish_vi_key_bindings
set -x GPG_TTY (tty)
set -x EDITOR nvim
set -x GPG_TTY (tty)
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source ~/.config/fish/functions/aliases.fish
end
starship init fish | source
