# ── Zinit ──────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# ── Plugins ───────────────────────────────────────
zinit light-mode for \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  zsh-users/zsh-syntax-highlighting \
  zsh-users/zsh-completions \
  zsh-users/zsh-history-substring-search

# ── Vi mode ───────────────────────────────────────
bindkey -v
export KEYTIMEOUT=1

# History substring search with arrow keys and vi keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ── History ───────────────────────────────────────
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# ── Completion ────────────────────────────────────
autoload -Uz compinit
compinit -d "$ZDOTDIR/.zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ── Aliases ───────────────────────────────────────
alias aliases="nvim $ZDOTDIR/.zshrc"
alias dots="cd ~/.config && vim ./"
alias g="git status"
alias gb="git branch"
alias gco="git checkout"
alias gpo="git push origin"
alias gpr="git pull --rebase origin"
alias grbi="git rebase -i"
alias ll="eza -al --git --icons=always"
alias vim="nvim"

# ── FZF ───────────────────────────────────────────
# Catppuccin Frappe theme + layout defaults
export FZF_DEFAULT_OPTS="\
--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker='*' \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--color=selected-bg:#51576d \
--color=border:#737994,label:#c6d0f5"

# Propagate to tmux so popups inherit the theme
if [[ -n "$TMUX" ]]; then
  tmux set-environment FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS"
fi

# FZF keybindings and completion (installed via brew)
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" 2>/dev/null
source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2>/dev/null

# ── Tool integrations ────────────────────────────
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"

# ── Local config (machine-specific, not committed) ─
[[ -f "$ZDOTDIR/.zshrc.local" ]] && source "$ZDOTDIR/.zshrc.local"
