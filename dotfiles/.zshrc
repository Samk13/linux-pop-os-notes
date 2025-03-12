# append the following:


# Sam setup

# https://starship.rs/guide/
eval "$(starship init zsh)"

# https://github.com/marlonrichert/zsh-autocomplete
# source /Users/samk13/.shell-tools/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# https://github.com/zsh-users/zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# fzf
# ===

# Drakola theme for fzf
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#131e29,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Set FZF_ALT_C_COMMAND to list non-hidden directories first, then hidden ones, excluding .git
# export FZF_ALT_C_COMMAND='(find . -type d -not -path "*/\.*" -not -path "./.git/*"; find . -type d -path "*/\.*" -not -path "./.git/*")'

# Use --tiebreak=index to preserve input order for fzf-cd-widget
# export FZF_ALT_C_OPTS='--tiebreak=index'

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip Library,node_modules,target,.git,.pyenv,.nvm,.Trash,.local,.oh-my-zsh
  --preview 'tree -C {}'"
# Bind fzf-cd-widget to Command+C (assuming terminal sends \e[c for Command+C)
bindkey 'ç' fzf-cd-widget
source <(fzf --zsh)
# fzf end ====================================



# https://docs.astral.sh/uv/getting-started/installation/#__tabbed_3_2
eval "$(uv generate-shell-completion zsh)"

# https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# https://github.com/pyenv/pyenv?tab=readme-ov-file#b-set-up-your-shell-environment-for-pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# https://github.com/pyenv/pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# pyenv virtualenv automatically sets the shell prompt
export PYENV_VIRTUALENV_DISABLE_PROMPT=1 

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/samk13/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# add nvim to path
export PATH="/usr/local/nvim/bin:$PATH"

alias vim=nvim
alias vi=nvim
