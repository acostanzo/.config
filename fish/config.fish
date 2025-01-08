set -g fish_key_bindings fish_vi_key_bindings
set -g -x PIP_REQUIRE_VIRTUALENV true

set -x EDITOR nvim
set -x GPG_TTY (tty)
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

source ~/.config/fish/functions/aliases.fish
starship init fish | source

source /opt/homebrew/opt/asdf/libexec/asdf.fish
