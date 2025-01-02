# machine specific configs
source "${HOME}/.iterm2_shell_integration.zsh"
[ -f ~/.zshrc.local ] && source "${HOME}/.zshrc.local"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# seems to break zsh
# test -e /usr/local/opt/zsh-vi-mode && source /usr/local/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

eval "$(starship init zsh)"
export EDITOR="nvim"
export BAT_THEME="Dracula"

# Aliases
alias g="git"
alias g-cleanup='git branch | grep -v "main" | xargs git branch -D'
alias grh='git reset --hard && git clean -fd'
alias be="bundle exec"
alias bake="bundle exec rake"
alias vi="nvim"
alias cat="bat --style=plain"
alias tm="tmux attach || tmux new"

# Functions
wip() {
  if [ -z "$1" ]
  then
    g acnv "WIP" --no-verify
  else
    g asnv $1 "WIP" --no-verify
  fi
}

eval "$(/Users/akshay/.local/bin/mise activate zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/akshay/.cache/lm-studio/bin"
