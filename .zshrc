# append the following:

# https://starship.rs/guide/
eval "$(starship init zsh)"

# https://github.com/marlonrichert/zsh-autocomplete
source /Users/samk13/.shell-tools/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# https://github.com/zsh-users/zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# fzf
# ===

# Drakola theme for fzf
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#131e29,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# alt+c fix for fzf-cd

fzf-cd() {
  local dir
  dir=$(find ${1:-.} -type d 2>/dev/null | fzf +m) && cd "$dir"
}

# Create a custom widget
zle -N fzf-cd-widget
# Bind Alt+C (assuming it sends ç) to the custom widget
bindkey "ç" fzf-cd-widget
# fzf end ====================================


# https://docs.astral.sh/uv/getting-started/installation/#__tabbed_3_2
eval "$(uv generate-shell-completion zsh)"

# https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
