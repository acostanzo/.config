# Catppuccin Frappe theme for fzf
# https://github.com/catppuccin/fzf
#
# Also includes fzf.fish plugin layout defaults since setting FZF_DEFAULT_OPTS
# prevents _fzf_wrapper.fish from applying its own defaults.
set -gx FZF_DEFAULT_OPTS "\
--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker='*' \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--color=selected-bg:#51576d \
--color=border:#737994,label:#c6d0f5"
