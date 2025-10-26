set -g fish_key_bindings fish_vi_key_bindings
set -gx PIP_REQUIRE_VIRTUALENV true

set -x EDITOR nvim
set -x GPG_TTY (tty)
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
set -x XDG_CONFIG_HOME ~/.config

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

source ~/.config/fish/functions/aliases.fish
starship init fish | source

if functions -q local_config
    local_config
end

mise activate fish | source

zoxide init fish | source

alias claude="/Users/acostanzo/.claude/local/claude"
